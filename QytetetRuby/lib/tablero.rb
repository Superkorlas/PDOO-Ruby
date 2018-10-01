#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module ModeloQytetet
  require_relative "tipo_casilla"
  require_relative "casilla"
  
  class Tablero
    attr_reader :casillas, :carcel
    
    def initialize
      inicializar_tablero()
    end
  
    def inicializar_tablero
      @casillas=Array.new
      
      
      
      #Rellenar las demas, ver Tablero.java
      casilla_salida    =Casilla.new(0, TipoCasilla::SALIDA)
      @casillas << casilla_salida
      
      titulo1 = Titulo.new(nombre, precioCompra, alquilerBase, factorRevalorizacion, hipotecaBase, precioEdificar)
      casilla_calle1
      @casillas
            
      casilla_carcel    =Casilla.new(5, TipoCasilla::CARCEL)
      @casillas << casilla_carcel
      
      casilla_sorpresa1 =Casilla.new(7, TipoCasilla::SORPRESA)
      @casillas << casilla_sorpresa1
      
      casilla_parking   =Casilla.new(10, TipoCasilla::PARKING)
      @casillas << casilla_parking
      
      casilla_impuesto  =Casilla.new(12, TipoCasilla::IMPUESTO)
      @casillas << casilla_impuesto
      
      casilla_sorpresa2 =Casilla.new(13, TipoCasilla::SORPRESA)
      @casillas << casilla_sorpresa2
      
      casilla_juez      =Casilla.new(15, TipoCasilla::JUEZ)
      @casillas << casilla_juez
      
      casilla_sorpresa3 =Casilla.new(18, TipoCasilla::SORPRESA)
      @casillas << casilla_sorpresa3  
                
      @carcel=casilla_carcel
            
    end
      
    def to_s
      retorno="Casillas:\n"
      
      for i in @casillas
        retorno+=i.to_s
      end
      
      return retorno + "#{carcel}"
    end
  end


end