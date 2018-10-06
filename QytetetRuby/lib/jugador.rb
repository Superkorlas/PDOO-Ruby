# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class Jugador
    
    attr_reader :nombre, :saldo, :propiedades
    attr_accessor :encarcelado, :carta_libertad, :casilla_actual
    
    def initialize
      
    end
    
    
    def cancelar_hipoteca(titulo)
      raise NotImplementedError
    end
    
    
    def comprar_titulo_propiedad
      raise NotImplementedError
    end
    
    
    def cuantas_casas_hoteles_tengo
      raise NotImplementedError
    end
    
    
    def debo_pagar_alquiler
      raise NotImplementedError
    end
    
    
    def devolver_carta_libertad
      raise NotImplementedError
    end
    
    
    def edificar_casa(titulo)
      raise NotImplementedError
    end
    
    
    def edificar_hotel(titulo)
      raise NotImplementedError
    end
    
    
    def eliminar_de_mis_propiedades(titulo)
      
    end
    
    
    def es_de_mi_propiedad(titulo)
      raise NotImplementedError
    end
    
    
    def estoy_en_calle_libre
      raise NotImplementedError
    end
    
    
    def hipotecar_propiedad(titulo)
      raise NotImplementedError
    end
    
    
    def ir_a_carcel(casilla)
      
    end
    
    
    def modificar_saldo(int)
      raise NotImplementedError
    end
    
    
    def obtener_capital
      raise NotImplementedError
    end
    
    
    def obtener_propiedades(hipotecada)
      raise NotImplementedError
    end
    
    
    def pagar_alquiler
      
    end
    
    
    def pagar_impuesto
      
    end
    
    
    def pagar_libertad(cantidad)
      
    end
    
    
    def tengo_carta_libertad
      raise NotImplementedError
    end
    
    
    def tengo_saldo(cantidad)
      raise NotImplementedError
    end
    
    
    def vender_propiedad(casilla)
      raise NotImplementedError
    end
    

    def to_s
      return "Jugador: nombre=#{nombre}, saldo=#{saldo}, propiedades=#{propiedades}, casilla_actual= #{casilla_actual}, encarcelado= #{encarcelado}, carta_libertad=#{carta_libertad}"
    end
    
  end
end
