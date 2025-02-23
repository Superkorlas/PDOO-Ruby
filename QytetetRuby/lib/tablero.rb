#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module ModeloQytetet
  require_relative "tipo_casilla"
  require_relative "otra_casilla"
  require_relative "calle"
  require_relative "titulo_propiedad"
  
  class Tablero
    attr_reader :casillas, :carcel
    
    def initialize
      inicializar
    end
    
    def es_casilla_carcel(numero_casilla)
      return (@carcel.numero_casilla == numero_casilla)
    end
  
    def inicializar
      @casillas=Array.new
      
      #Rellenar las demas, ver Tablero.java
      casilla_salida    =OtraCasilla.new(0, TipoCasilla::SALIDA)
      @casillas << casilla_salida
      
      titulo1 = TituloPropiedad.new("Viso", 558, 356, 12.5, 55, 550)
      casilla_calle1 = Calle.new(1, titulo1)
      @casillas << casilla_calle1
      
      titulo2 = TituloPropiedad.new("Parque de los Angeles", 794, 670, 18.0, 50, 600)
      casilla_calle2 = Calle.new(2, titulo2)
      @casillas << casilla_calle2
      
      titulo3 = TituloPropiedad.new("Calle San Andres", 787, 324, 13.0, 65, 475)
      casilla_calle3 = Calle.new(3, titulo3)
      @casillas << casilla_calle3
      
      titulo4 = TituloPropiedad.new("Barrio Alto", 565, 402, 10.0, 50, 200)
      casilla_calle4 = Calle.new(4, titulo4)
      @casillas << casilla_calle4
            
      casilla_carcel = OtraCasilla.new(5, TipoCasilla::CARCEL)
      @casillas << casilla_carcel
      
      titulo6 = TituloPropiedad.new("Estacion", 934, 334, 14.0, 95, 865)
      casilla_calle6 = Calle.new(6, titulo6)
      @casillas << casilla_calle6
      
      casilla_sorpresa1 =OtraCasilla.new(7, TipoCasilla::SORPRESA)
      @casillas << casilla_sorpresa1
      
      titulo8 = TituloPropiedad.new("Barrio San Francisco", 918, 268, 13.9, 90, 789)
      casilla_calle8 = Calle.new(8, titulo8)
      @casillas << casilla_calle8
      
      titulo9 = TituloPropiedad.new("Calle San Isidro", 998, 313, 16.87, 100, 1000)
      casilla_calle9 = Calle.new(9, titulo9)
      @casillas << casilla_calle9
      
      casilla_parking = OtraCasilla.new(10, TipoCasilla::PARKING)
      @casillas << casilla_parking
      
      titulo11 = TituloPropiedad.new("Alcazaba", 814, 670, 20.0, 75, 650)
      casilla_calle11 = Calle.new(11, titulo11)
      @casillas << casilla_calle11
      
      casilla_impuesto = OtraCasilla.new(12, TipoCasilla::IMPUESTO)
      @casillas << casilla_impuesto
      
      casilla_sorpresa2 = OtraCasilla.new(13, TipoCasilla::SORPRESA)
      @casillas << casilla_sorpresa2
      
      titulo14 = TituloPropiedad.new("Esperanza", 989, 674, 19.0, 70, 980)
      casilla_calle14 = Calle.new(14, titulo14)
      @casillas << casilla_calle14
      
      casilla_juez = OtraCasilla.new(15, TipoCasilla::JUEZ)
      @casillas << casilla_juez
      
      titulo16 = TituloPropiedad.new("Meson de Arroyo", 903, 535, 14.75, 85, 865)
      casilla_calle16 = Calle.new(16, titulo16)
      @casillas << casilla_calle16
      
      titulo17 = TituloPropiedad.new("El Cuellos", 686, 599, 20.0, 100, 530)
      casilla_calle17 = Calle.new(17, titulo17)
      @casillas << casilla_calle17
      
      casilla_sorpresa3 = OtraCasilla.new(18, TipoCasilla::SORPRESA)
      @casillas << casilla_sorpresa3  
      
      titulo19 = TituloPropiedad.new("Alfaguara", 755, 387, 19.75, 70, 350)
      casilla_calle19 = Calle.new(19, titulo19)
      @casillas << casilla_calle19
      
      @carcel=casilla_carcel
            
    end
    
    
    def obtener_casilla_final(casilla, desplazamiento)
      num_casilla = (casilla.numero_casilla + desplazamiento) % @casillas.length
      cas_resultado = @casillas.at(num_casilla)
      return cas_resultado
    end
    
    
    def obtener_casilla_numero(numero_casilla)
      return (@casillas.at(numero_casilla))
    end
    
      
    def to_s
      retorno="Casillas:\n"
      
      for i in @casillas
        retorno+=i.to_s
      end
      
      return retorno + "#{carcel}"
    end
    
    private :inicializar
  end
end
