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
      mazo<< Sorpresa.new("", 0, TipoSorpresa::SALIRCARCEL)
      mazo<< Sorpresa.new("", 1, TipoSorpresa::PORJUGADOR)
      mazo<< Sorpresa.new("", 2, TipoSorpresa::PORJUGADOR)
      mazo<< Sorpresa.new("", 3, TipoSorpresa::PORCASAHOTEL)
      mazo<< Sorpresa.new("", 4, TipoSorpresa::PORCASAHOTEL)
      mazo<< Sorpresa.new("", 5, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("", 6, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("", 7, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("", 8, TipoSorpresa::PAGARCOBRAR)
      mazo<< Sorpresa.new("", 0, TipoSorpresa::PAGARCOBRAR)
    end
    
  end
end
