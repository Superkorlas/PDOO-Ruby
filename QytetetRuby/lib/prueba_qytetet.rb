#encoding: utf-8
module ModeloQytetet
  
  require_relative "qytetet"
  require_relative "tipo_sorpresa"
  
  class PruebaQytetet
    
    @@juego = Qytetet.new
    
    def self.main()      
      @@juego.inicializar_cartas_sorpresa()
      #puts @@juego.mazo.inspect
      
      puts "Empezando pruebas ..."
      
      for tmp in Mayor0()
        puts tmp.to_s()
      end
      
      for tmp in TipoIrCasilla()
        puts tmp.to_s()
      end
      
      for tmp in DevuelveTipo(TipoSorpresa::SALIRCARCEL)
        puts tmp.to_s()
      end
      
      puts "Pruebas de TipoSorpresa finalizadas ..."
      
      @@juego.inicializar_tablero()
      puts "Información del Tablero:"
      puts @@juego.tablero.to_s()
      
    end
    
    def self.Mayor0()
      resultado = Array.new
      for it in @@juego.mazo
        if it.valor > 0
          resultado << it
        end
      end
      return resultado
    end
    
    def self.TipoIrCasilla()
      resultado = Array.new
      for it in @@juego.mazo
        if it.tipo == TipoSorpresa::IRACASILLA
          resultado << it
        end
      end
      return resultado
    end
    
    def self.DevuelveTipo(tipoSorpresa)
      resultado = Array.new
      for it in @@juego.mazo
        if it.tipo == tipoSorpresa
          resultado << it
        end
      end
      return resultado
    end
    
  end
  
  PruebaQytetet.main()
  
end

