# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module ModeloQytetet
#require_relative 'especulador'

  class Jugador
    
    attr_reader :nombre, :saldo, :propiedades
    attr_accessor :encarcelado, :carta_libertad, :casilla_actual
    
    def initialize(nombre)
      @nombre=nombre
      @saldo=7500
      @encarcelado=false 
      @carta_libertad=nil
      @casilla_actual=nil
      @propiedades=Array.new
    end
    
    def copia_atributos(jugador)
      @nombre=jugador.nombre
      @saldo=jugador.saldo
      @encarcelado=jugador.encarcelado 
      @carta_libertad=jugador.carta_libertad
      @casilla_actual=jugador.casilla_actual
      @propiedades=jugador.propiedades
    end
    
    def <=> (otro_jugador)
      otro_capital = otro_jugador.obtener_capital
      mi_capital = obtener_capital
      if otro_capital>mi_capital
        return 1
      end
      if otro_capital<mi_capital
        return -1
      end
      return 0
    end
    
    def convertirme (fianza)
      especulador = Especulador.new(self, fianza)
      return especulador
    end
    
    def debo_ir_a_carcel      
      return !tengo_carta_libertad
    end
    
    def puedo_edificar_casa(titulo)
      puedo_edificar = false
      
      if tengo_saldo(titulo.precio_edificar)
        if titulo.num_casas < 4
          puedo_edificar = true
        end
      end
      
      return puedo_edificar
    end
    
    def puedo_edificar_hotel(titulo)
      puedo_edificar = false
      
      if tengo_saldo(titulo.precio_edificar)
        if titulo.num_hoteles < 4 && titulo.num_casas >= 4
          puedo_edificar = true
        end
      end
      
      return puedo_edificar
    end
    
    def cancelar_hipoteca(titulo)
      coste = titulo.calcular_coste_cancelar
      hipotecada = false
      if(coste < @saldo)
        modificar_saldo(-coste)
        hipotecada = titulo.cancelar_hipoteca
      end
      return hipotecada
    end
    
    
    def comprar_titulo_propiedad
      comprado = false
      coste_compra = @casilla_actual.coste
      if(coste_compra < @saldo)
        titulo = @casilla_actual.asignar_propietario(self)
        @propiedades << titulo
        modificar_saldo(-coste_compra)
        comprado = true
      end
      return comprado
    end
    
    
    def cuantas_casas_hoteles_tengo
      total = 0
      for propiedad in @propiedades
        total += propiedad.num_casas + propiedad.num_hoteles
      end
      return total
    end
    
    
    def debo_pagar_alquiler
      
        es_de_mi_propiedad = es_de_mi_propiedad(@casilla_actual.titulo)
        if(!es_de_mi_propiedad)
          tiene_propietario = @casilla_actual.tengo_propietario
          if(tiene_propietario)
            p_encarcelado = @casilla_actual.propietario_encarcelado
            if(!p_encarcelado)
              esta_hipotecada = @casilla_actual.titulo.hipotecada
              return !esta_hipotecada
            end
          end
        end

        return false
    end
    
    
    def devolver_carta_libertad
      carta_libertad = @carta_libertad
      @carta_libertad = nil
      return carta_libertad
    end
    
    
    def edificar_casa(titulo)
      edificada = false
      if puedo_edificar_casa(titulo)
        titulo.edificar_casa
        modificar_saldo(-titulo.precio_edificar)
        edificada = true
      end
      return edificada
    end
    
    
    def edificar_hotel(titulo)
      edificada = false
      if puedo_edificar_hotel(titulo)
        titulo.edificar_hotel
        modificar_saldo(-titulo.precio_edificar)
        edificada = true
      end
      return edificada
    end
    
    
    def eliminar_de_mis_propiedades(titulo)
      @propiedades.delete(titulo)
      titulo.propietario = nil
    end
    
    
    def es_de_mi_propiedad(titulo)
      for propiedad in @propiedades
        if (propiedad == titulo)
          return true
        end
      end
      return false
    end
    
    
    def estoy_en_calle_libre
      return @casilla_actual.tengo_propietario
    end
    
    
    def hipotecar_propiedad(titulo)
      coste_hipoteca = titulo.hipotecar
      modificar_saldo(coste_hipoteca)
    end
    
    
    def ir_a_carcel(casilla)
      @casilla_actual = casilla
      @encarcelado = true
    end
    
    def modificar_saldo(modificacion)
      @saldo += modificacion
      return @saldo
    end
    
    
    def obtener_capital
      saldo_total = @saldo
      for propiedad in @propiedades
          saldo_total += (propiedad.precio_compra() +(propiedad.num_casas() + propiedad.num_hoteles())) * propiedad.precio_edificar()
      end
      return saldo_total
    end
    
    
    def obtener_propiedades(hipotecada)
      propiedades = Array.new
      for propiedad in @propiedades
        if (propiedad.hipotecada == hipotecada)
          propiedades<<propiedad
        end
      end
      return propiedades
    end
    
    
    def pagar_alquiler
      coste_alquiler = @casilla_actual.pagar_alquiler
      modificar_saldo(-coste_alquiler)
    end
    
    
    def pagar_impuesto
      @saldo -= @casilla_actual.coste 
    end
    
    
    def pagar_libertad(cantidad)
      tengo_saldo = tengo_saldo(cantidad)
      if tengo_saldo
        @encarcelado = false
        modificar_saldo(-cantidad)
      end
    end
    
    
    def tengo_carta_libertad
      return (@carta_libertad != nil)
    end
    
    def tengo_propiedades
      if (@propiedades.empty?)
        return false
      end
      return true
    end
    
    
    def tengo_saldo(cantidad)
      return (@saldo >= cantidad)
    end
    
    
    def vender_propiedad(casilla)
      titulo = casilla.titulo
      eliminar_de_mis_propiedades(titulo)
      precio_venta = titulo.calcular_precio_venta
      modificar_saldo(precio_venta)
    end
    
    

    def to_s
      return "\nJugador: nombre=#{@nombre}, saldo=#{@saldo}, capital total=#{obtener_capital} propiedades=#{@propiedades}, casilla_actual= #{@casilla_actual}, encarcelado= #{@encarcelado}, carta_libertad=#{@carta_libertad}"
    end
    
    private :eliminar_de_mis_propiedades, :es_de_mi_propiedad
    protected :tengo_saldo, :debo_ir_a_carcel
    
  end
end
