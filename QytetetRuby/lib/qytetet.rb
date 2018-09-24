#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  
  require_relative "sorpresa"
  require_relative "tipo_sorpresa"
  
  class Qytetet
    attr_reader :mazo
    
    def initialize
      @mazo=Array.new
    end

    def inicializar_cartas_sorpresa    
      mazo<< Sorpresa.new("Al margen de la ley", 0, TipoSorpresa::SALIRCARCEL)
      mazo<< Sorpresa.new("Todos te pagan", 100, TipoSorpresa::PORJUGADOR)
      mazo<< Sorpresa.new("Debes pagar tus deudas con el resto", 50, TipoSorpresa::PORJUGADOR)
      mazo<< Sorpresa.new("¡Tus casas y hoteles generan beneficios!", 100, TipoSorpresa::PORCASAHOTEL)
      mazo<< Sorpresa.new("Te toca pagar impuesto por tus casas y hoteles", 200, TipoSorpresa::PORCASAHOTEL)
      mazo<< Sorpresa.new("", 5, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("", 6, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("", 7, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("", 8, TipoSorpresa::PAGARCOBRAR)
      mazo<< Sorpresa.new("", 0, TipoSorpresa::PAGARCOBRAR)
    end
    
  end
end
