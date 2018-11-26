#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  
  require_relative "tipo_casilla"
  
  class Casilla
    attr_reader :numero_casilla
    attr_accessor :coste
  
    def initialize(numeroCasilla)
      @numero_casilla=numeroCasilla
      @coste=500
    end    
    
    def soy_edificable
      return false
    end
   
  end

end
