# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "casilla"

module ModeloQytetet
  class Calle < Casilla
    attr_reader :titulo
    
    def initialize(numero_casilla, titulo)
      super(numero_casilla)
      @titulo=titulo
      @tipo = TipoCasilla::CALLE
      @coste = titulo.precio_compra
    end  
    
    def asignar_propietario(jugador)
      @titulo.propietario = jugador
      return @titulo
    end
    
    def tipo
      return TipoCasilla::CALLE
    end
    
    def soy_edificable
      return true
    end
        
    def tengo_propietario
      return @titulo.tengo_propietario
    end
        
    def propietario_encarcelado
      return @titulo.propietario_encarcelado
    end
    
    def to_s
      return "tipo: #{@tipo}, numeroCasilla: #{@numero_casilla}, coste: #{@coste}, @titulo: #{@titulo}"
    end
    
  end
end
