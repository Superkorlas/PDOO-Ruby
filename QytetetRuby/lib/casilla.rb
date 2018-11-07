#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  
  require_relative "tipo_casilla"
  
  class Casilla
      attr_reader :numero_casilla, :coste, :tipo, :titulo
      #attr_writer :titulo
  
    def initialize(numeroCasilla, tipo , titulo )
      @numero_casilla=numeroCasilla
      if (tipo != nil) # Si recibe tipo
        @coste=500
        @tipo=tipo
        @titulo=nil
      else # Si no recibe tipo
        @titulo=titulo
        @tipo = TipoCasilla::CALLE
        @coste = titulo.precio_compra
      end
    end
    
    def self.create_calle(numeroCasilla, titulo)
      new(numeroCasilla, nil, titulo)
    end
    
    def self.create_no_calle(numeroCasilla, tipo)
      new(numeroCasilla, tipo, nil)
    end
    
    
    def asignar_propietario(jugador)
      @titulo.propietario = jugador
    end
    
    
    def pagar_alquiler
      coste_alquiler = @titulo.pagar_alquiler
      return coste_alquiler
    end
    
    
    def propietario_encarcelado
      return @titulo.propietario_encarcelado
    end
    
    def set_titulo(nuevo_titulo)
      @titulo = nuevo_titulo
    end
    
    
    def soy_edificable
      return (@tipo == TipoCasilla::CALLE)
    end
    
    
    def tengo_propietario
      return @titulo.tengo_propietario
    end
    
    def to_s
      if(@tipo == TipoCasilla::CALLE)
        return "tipo: #{@tipo}, numeroCasilla: #{@numero_casilla}, coste: #{@coste}, @titulo: #{@titulo}"
      else
        return "tipo: #{@tipo}, numeroCasilla: #{@numero_casilla}"
      end
    end
    
    private :set_titulo
  end

end
