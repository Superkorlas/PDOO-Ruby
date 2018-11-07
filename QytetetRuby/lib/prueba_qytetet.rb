#encoding: utf-8
module ModeloQytetet
  
  require_relative "qytetet"
  require_relative "tablero"
  require_relative "tipo_sorpresa"
  
  class PruebaQytetet
    
    @@juego = Qytetet.instance
    
    def self.main() 
      puts "============================================"
      puts "============BIENVENIDO A QYTETET============"
      puts "============================================"
      puts "=========Alejandro de la Plata Ramos========"
      puts "===========Robin Costas del Moral==========="
      puts "============================================"
      
      nombres = ['Plata','Robin','Charo','Angela']
      
      @@juego.inicializar_juego(nombres)
      
      
      self.test_comprar_calle
      
    end
    
    def self.get_nombre_jugadores()
      nombres = Array.new
      
      begin
        puts "Introduce el numero de jugadores [2 a 4]: "
        STDOUT.flush
        num = (gets.chomp).to_i
      end while (num < 2 or num > 4)
      
      puts "Habra " + num.to_s + " jugadores."
      
      for i in 0..num-1
        puts "Jugador #{(i+1).to_s}: "
        STDOUT.flush
        nombre = gets.chomp
        nombres<< nombre
      end
      return nombres
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
      
    def self.test_mover_jugadores
      
      for i in 0..3
        test_aplicar_sorpresa
      end

    end
    
    def self.test_aplicar_sorpresa
      @@juego.mover(7)
      @@juego.aplicar_sorpresa
      puts @@juego.carta_actual.to_s
      puts @@juego.jugador_actual.to_s
      @@juego.siguiente_jugador
    end
    
    def self.test_comprar_calle
      @@juego.mover(1)
      #puts "He podido comprar? #{@@juego.comprar_titulo_propiedad}"
      @@juego.siguiente_jugador
      @@juego.mover(1)
      puts @@juego.jugadores.join
    end
  end

  
  PruebaQytetet.main()
  
end

