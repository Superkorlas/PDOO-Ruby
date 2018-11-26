# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "casilla"

module ModeloQytetet
  class OtraCasilla < Casilla
    attr_reader :tipo
    
    def initialize(numero_casilla, tipo)
      super(numero_casilla)
      @tipo = tipo      
    end
    
    def to_s
      return "tipo: #{@tipo}, numeroCasilla: #{@numero_casilla}"
    end
    
  end
end
