# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  
  require_relative "tipo_casilla"
  
  class Casilla
      attr_reader :numeroCasilla, :coste, :tipo, :titulo
      attr_writer :titulo
  
    def initialize(numeroCasilla, titulo)
      @numeroCasilla=numeroCasilla
      @titulo=titulo
      @tipo = TipoCasilla::CALLE
      @titulo = titulo.getPrecioCompra()
    end
    
    def initialize(numeroCasilla, tipo)
      @numeroCasilla=numeroCasilla
      @coste=-1
      @tipo=tipo
      @titulo=nil
    end
    
    def to_s
      if(@tipo == TipoCasilla::CALLE)
        return "tipo: #{tipo}, numeroCasilla: #{numeroCasilla}, coste: #{coste}, @titulo: #{titulo}\n"
      else
        return "tipo: #{tipo}, numeroCasilla: #{numeroCasilla}\n"
      end

    end
  end

end