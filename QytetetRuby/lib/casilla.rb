#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  
  require_relative "tipo_casilla"
  
  class Casilla
      attr_reader :numeroCasilla, :coste, :tipo, :titulo
      attr_writer :titulo
  
    def initialize(numeroCasilla, tipo , titulo )
      @numeroCasilla=numeroCasilla
      if (tipo != nil) # Si recibe tipo
        @coste=-1
        @tipo=tipo
        @titulo=nil
      else # Si no recibe tipo
        @titulo=titulo
        @tipo = TipoCasilla::CALLE
        @coste = titulo.precioCompra
      end
    end
    
    def self.create_calle(numeroCasilla, titulo)
      new(numeroCasilla, nil, titulo)
    end
    
    def self.create_no_calle(numeroCasilla, tipo)
      new(numeroCasilla, tipo, nil)
    end
    
    def to_s
      puts self.inspect
      if(@tipo == TipoCasilla::CALLE)
        return "tipo: #{@tipo}, numeroCasilla: #{@numeroCasilla}, coste: #{@coste}, @titulo: #{@titulo}\n"
      else
        return "tipo: #{tipo}, numeroCasilla: #{numeroCasilla}\n"
      end

    end
  end

end