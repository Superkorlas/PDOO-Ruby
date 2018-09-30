# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module ModeloQytetet
  require_relative "tipo_casilla"
  
  class Tablero
    attr_reader :casillas, :carcel
    
    def initialize
      inicializar()
    end
  
    def inicializar
      @casillas=Array.new
      
      #Rellenar las demas, ver Tablero.java
      casilla_salida=Casilla.new(0, TipoCasilla::SALIDA)
      @casillas << casilla_salida
            
    end
  end

  def to_s
    puts "casillas: #{casillas}, carcel= #{carcel}"
  end
end