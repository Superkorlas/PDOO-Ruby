# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'qytetet'
require_relative 'jugador'
require_relative 'especulador'
  
module Test
  class MainTest
    def initialize
    end
      
      def self.test_mover_jugadores

        @@juego.tirar_dado
        @@juego.mover(@@juego.valor_dado)
        @@juego.siguiente_jugador

        @@juego.tirar_dado
        @@juego.mover(@@juego.valor_dado)
        @@juego.siguiente_jugador

        @@juego.tirar_dado
        @@juego.mover(@@juego.valor_dado)
        @@juego.siguiente_jugador

        @@juego.tirar_dado
        @@juego.mover(@@juego.valor_dado)
        @@juego.siguiente_jugador

        puts @@juego.jugadores.join

      end

      def self.test_aplicar_sorpresa
        @@juego.mover(7)
        @@juego.aplicar_sorpresa
        puts @@juego.carta_actual.to_s
        puts @@juego.jugador_actual.to_s
        @@juego.siguiente_jugador
      end

      def self.test_comprar_calle_cobrar
        @@juego.mover(1)
        puts "He podido comprar? #{@@juego.comprar_titulo_propiedad}"
        @@juego.siguiente_jugador
        @@juego.mover(1)
        puts @@juego.jugadores.join
      end

      def self.test_edificar_casa_cobrar
        @@juego.mover(1)
        @@juego.comprar_titulo_propiedad
        @@juego.edificar_casa(1)
        @@juego.siguiente_jugador
        @@juego.mover(1)
        puts @@juego.jugadores.join
      end
      
      def self.test_edificar_hotel_cobrar
      @@juego.mover(1)
      @@juego.comprar_titulo_propiedad
      @@juego.edificar_casa(1)
      @@juego.edificar_casa(1)
      @@juego.edificar_casa(1)
      @@juego.edificar_casa(1)
      @@juego.edificar_hotel(1)
      @@juego.siguiente_jugador
      @@juego.mover(1)
      puts @@juego.jugadores.join
    end

      def self.test_hipotecar_e_intentar_cobrar
        @@juego.mover(1)
        @@juego.comprar_titulo_propiedad
        @@juego.hipotecar_propiedad(1)
        @@juego.siguiente_jugador
        @@juego.mover(1)
        puts @@juego.jugadores.join
      end

      def self.test_cancelar_hipoteca_cobrar
        @@juego.mover(1)
        @@juego.comprar_titulo_propiedad
        @@juego.hipotecar_propiedad(1)
        @@juego.cancelar_hipoteca(1)
        @@juego.siguiente_jugador
        @@juego.mover(1)
        puts @@juego.jugadores.join
      end

      def self.test_jugador_encarcelado_no_cobra
        @@juego.mover(1)
        @@juego.comprar_titulo_propiedad
        @@juego.mover(15)   # movemos jugador a la casilla del juez para que vaya a la carcel

        @@juego.siguiente_jugador
        @@juego.mover(1)

        puts @@juego.jugadores.join
      end
      
      def self.test_enviar_carcel_jugador_especulativo
        jugador = ModeloQytetet::Jugador.new("Especulador")
        especulador = ModeloQytetet::Especulador.new(jugador, 100)
        especulador.ir_a_carcel(5)
        puts especulador
      end
      
      def self.ejecutar_tests
        @@juego = ModeloQytetet::Qytetet.instance
        nombres = ['Plata','Robin','Charo','Angela']
        @@juego.inicializar_juego(nombres)
        #Pon aqui los test que deseas realizar
        test_enviar_carcel_jugador_especulativo
      end
    
    end
    
    MainTest.ejecutar_tests
  end
