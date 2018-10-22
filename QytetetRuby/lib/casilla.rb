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
        @coste=-1
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
      raise NotImplementedError
    end
    
    
    def pagar_alquiler
      raise NotImplementedError
    end
    
    
    def propietario_encarcelado
      raise NotImplementedError
    end
    
    def set_titulo(nuevo_titulo)
      @titulo = nuevo_titulo
    end
    
    
    def soy_edificable
      raise NotImplementedError
    end
    
    
    def tengo_propietario
      raise NotImplementedError
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
