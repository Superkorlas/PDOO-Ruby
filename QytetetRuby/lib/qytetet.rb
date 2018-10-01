#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  
  require_relative "sorpresa"
  require_relative "tipo_sorpresa"
  
  class Qytetet
    attr_reader :mazo
    attr_accessor :tablero
    
    def initialize
      @mazo=Array.new
    end
    
    def inicializar_tablero
      @tablero=Tablero.new
    end

    def inicializar_cartas_sorpresa    
      mazo<< Sorpresa.new("De vuelta al pricipio, vuelves a la casilla de salida", 0, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("Que suerte, te vas a la carcel", 0, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("Poca broma, te vas a la ultima casilla del juego", 0, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("Felicidades maquina, recibes dinero de todos por tu cumple", 50, TipoSorpresa::PAGARCOBRAR)
      mazo<< Sorpresa.new("Vaya, te toca pagar a todos por moroso", 100, TipoSorpresa::PAGARCOBRAR)
      mazo<< Sorpresa.new("Al margen de la ley", 0, TipoSorpresa::SALIRCARCEL)
      mazo<< Sorpresa.new("Todos te pagan", 100, TipoSorpresa::PORJUGADOR)
      mazo<< Sorpresa.new("Debes pagar tus deudas con el resto", 50, TipoSorpresa::PORJUGADOR)
      mazo<< Sorpresa.new("¡Tus casas y hoteles generan beneficios!", 100, TipoSorpresa::PORCASAHOTEL)
      mazo<< Sorpresa.new("Te toca pagar impuesto por tus casas y hoteles", 200, TipoSorpresa::PORCASAHOTEL)

    end
    
  end
end
