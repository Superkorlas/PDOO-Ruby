# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class Jugador
    include Comparable
    
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
      
        es_de_mi_propiedad   = es_de_mi_propiedad(@casilla_actual.titulo)
        tiene_propietario    = @casilla_actual.tengo_propietario
        p_encarcelado        = @casilla_actual.propietario_encarcelado
        esta_hipotecada      = @casilla_actual.titulo.hipotecada

        return(!es_de_mi_propiedad & tiene_propietario & !p_encarcelado & !esta_hipotecada);
    end
    
    
    def devolver_carta_libertad
      carta_libertad = @carta_libertad
      @carta_libertad = nil
      return carta_libertad
    end
    
    
    def edificar_casa(titulo)
      num_casas = titulo.num_casas
      edificada = false
      hay_espacio = num_casas < 4
      if hay_espacio
        coste_edificar_casa = titulo.precio_edificar
        tengo_saldo = tengo_saldo(coste_edificar_casa)
        if tengo_saldo
          titulo.edificar_casa
          modificar_saldo(-coste_edificar_casa)
          edificada = true
        end
      end
      return edificada
    end
    
    
    def edificar_hotel(titulo)
      num_hoteles = titulo.num_hoteles
      edificada = false
      hay_espacio = num_hoteles < 4
      if hay_espacio
        coste_edificar_hotel = titulo.precio_edificar
        tengo_saldo = tengo_saldo(coste_edificar_hotel)
        if tengo_saldo
          titulo.edificar_hotel
          modificar_saldo(-coste_edificar_hotel)
          edificada = true
        end
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
      raise NotImplementedError
    end
    
    
    def hipotecar_propiedad(titulo)
      coste_hipoteca = titulo.hipotecar
      modificar_saldo(coste_hipoteca)
    end
    
    
    def ir_a_carcel(casilla)
      @casilla_actual = casilla
      @encarceladp = true
    end
    
    def modificar_saldo(modificacion)
      @saldo += modificacion
      return @saldo
    end
    
    
    def obtener_capital
      saldo_total = @saldo
      for propiedad in @propiedades
          saldo_total += propiedad.precio_compra + (propiedad.num_casas + propiedad.num_hoteles) * propiedad.precio_edificacion
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
    
    private :eliminar_de_mis_propiedades, :es_de_mi_propiedad, :tengo_saldo
    
  end
end
