# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class Especulador < Jugador
    
    attr_accessor :fianza
    
    def initialize (jugador, fianza)
      copia_atributos(jugador)
      @fianza = fianza
    end
    
    def pagar_impuesto (cantidad)
      @saldo -= (@casilla_actual.coste / 2)
    end
    
    def convertirme(fianza)
      return self
    end
    
    def debo_ir_a_carcel
      return super() && !pagar_fianza
    end
    
    def pagar_fianza
      if @fianza <= @saldo
        @saldo -= @fianza
        return true
      else 
        return false
      end
    end
    
    def puedo_edificar_casa(titulo)
      puedo_edificar = false
      
      if tengo_saldo(titulo.precio_edificar)
        if titulo.num_casas < 8
          puedo_edificar = true
        end
      end
      
      return puedo_edificar
    end
    
    def puedo_edificar_hotel(titulo)
      puedo_edificar = false
      
      if tengo_saldo(titulo.precio_edificar)
        if titulo.num_hoteles < 8 && titulo.num_casas >= 4
          puedo_edificar = true
        end
      end
      
      return puedo_edificar
    end
    
    def ir_a_carcel(casilla)
      if @carta_libertad == nil 
        if @saldo <= @fianza
          @casilla_actual = casilla
          @encarcelado = true
        else
          modificar_saldo(-@fianza)
        end
      end
    end
    
    def to_s
      return super() + ", fianza=#{@fianza}"
    end
    
    private :pagar_fianza
    
  end
end
