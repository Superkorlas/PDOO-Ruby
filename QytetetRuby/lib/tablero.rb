# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module ModeloQytetet
  require_relative "tipo_casilla"
  require_relative "casilla"
  
  class Tablero
    attr_reader :casillas, :carcel
    
    def initialize
      inicializar_tablero()
    end
  
    def inicializar_tablero
      @casillas=Array.new
      
      #Rellenar las demas, ver Tablero.java
      casilla_salida=Casilla.new(0, TipoCasilla::SALIDA)
      @casillas << casilla_salida
      @carcel=Casilla.new(1,TipoCasilla::CARCEL)
      @carcel.to_s
            
    end
      
    def to_s
      retorno="Casillas:\n"
      
      for i in @casillas
        retorno+=i.to_s
      end
      
      return retorno + "#{carcel}"
    end
  end


end