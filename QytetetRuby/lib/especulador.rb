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
      
    end
    
    def convertirme(fianza)
      
    end
    
    def debo_ir_a_carcel
      encarcelar = false
      
      return encarcelar
    end
    
    def pagar_fianza
      
    end
    
    def puedo_edificar_casa(titulo)
      puedo_edificar = false
      
      return puedo_edificar
    end
    
    def puedo_edificar_hotel(titulo)
      puedo_edificar = false
      
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
    
    private :pagar_fianza
    
  end
end
