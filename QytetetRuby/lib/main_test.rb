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
        # Todas las sorpresas deben ser TipoSorpresa::CONVERTIRME para que sea válido el test
        # Todos los jugadores acaban encarcelados menos el jugador especulativo
        puts "Jugador especulativo sera: " + @@juego.jugador_actual.nombre
        @@juego.mover(7)
        @@juego.aplicar_sorpresa
        @@juego.siguiente_jugador
        @@juego.mover(15)
        @@juego.siguiente_jugador
        @@juego.mover(15)
        @@juego.siguiente_jugador
        @@juego.mover(15)
        @@juego.siguiente_jugador
        @@juego.mover(15)
        puts @@juego.jugadores.join
      end
      
      def self.test_especulador_compra_seis_casas
        # Todas las sorpresas deben ser TipoSorpresa::CONVERTIRME para que sea válido el test
        puts "Jugador especulativo sera: " + @@juego.jugador_actual.nombre
        @@juego.mover(7)
        @@juego.aplicar_sorpresa
        @@juego.jugador_actual.modificar_saldo(100000)
        @@juego.mover(1)
        i = 0
        while (i < 6)
          @@juego.edificar_casa(@@juego.jugador_actual.casilla_actual.numero_casilla)
          i += 1
        end
        
        # Vemos que jugador normal no puede comprar más de 4 casas
        @@juego.siguiente_jugador
        @@juego.mover(2)
        @@juego.jugador_actual.modificar_saldo(100000)
        i = 0
        while (i < 6)
          @@juego.edificar_casa(@@juego.jugador_actual.casilla_actual.numero_casilla)
          i += 1
        end
        
        puts @@juego.jugadores.join
      end
      
      def self.test_especulador_intenta_comprar_nueve_casas
        # Todas las sorpresas deben ser TipoSorpresa::CONVERTIRME para que sea válido el test
        puts "Jugador especulativo sera: " + @@juego.jugador_actual.nombre
        @@juego.mover(7)
        @@juego.aplicar_sorpresa
        @@juego.jugador_actual.modificar_saldo(100000)
        @@juego.mover(1)
        i = 0
        while (i < 9)
          @@juego.edificar_casa(@@juego.jugador_actual.casilla_actual.numero_casilla)
          i += 1
        end
        puts @@juego.jugadores.join
      end
      
      def self.test_especulador_compra_seis_hoteles
        # Todas las sorpresas deben ser TipoSorpresa::CONVERTIRME para que sea válido el test
        puts "Jugador especulativo sera: " + @@juego.jugador_actual.nombre
        @@juego.mover(7)
        @@juego.aplicar_sorpresa
        @@juego.jugador_actual.modificar_saldo(100000)
        @@juego.mover(1)
        i = 0
        while (i < 6)
          j = 0
          while (j < 4)
            @@juego.edificar_casa(@@juego.jugador_actual.casilla_actual.numero_casilla)
            j += 1
          end
          @@juego.edificar_hotel(@@juego.jugador_actual.casilla_actual.numero_casilla)
          i += 1
        end
        
        # Vemos que jugador normal no puede comprar más de 4 hoteles
        @@juego.siguiente_jugador
        @@juego.mover(2)
        @@juego.jugador_actual.modificar_saldo(100000)
        i = 0
        while (i < 6)
          j = 0
          while (j < 4)
            @@juego.edificar_casa(@@juego.jugador_actual.casilla_actual.numero_casilla)
            j += 1
          end
          @@juego.edificar_hotel(@@juego.jugador_actual.casilla_actual.numero_casilla)
          i += 1
        end
        puts @@juego.jugadores.join
      end
      
      def self.test_especulador_intenta_comprar_nueve_hoteles
        # Todas las sorpresas deben ser TipoSorpresa::CONVERTIRME para que sea válido el test
        puts "Jugador especulativo sera: " + @@juego.jugador_actual.nombre
        @@juego.mover(7)
        @@juego.aplicar_sorpresa
        @@juego.mover(1)
        @@juego.jugador_actual.modificar_saldo(100000)
        i = 0
        while (i < 9)
          j = 0
          while (j < 4)
            @@juego.edificar_casa(@@juego.jugador_actual.casilla_actual.numero_casilla)
            j += 1
          end
          @@juego.edificar_hotel(@@juego.jugador_actual.casilla_actual.numero_casilla)
          i += 1
        end
        puts @@juego.jugadores.join
      end
      
      def self.ejecutar_tests
        @@juego = ModeloQytetet::Qytetet.instance
        nombres = ['Plata','Robin','Charo','Angela']
        @@juego.inicializar_juego(nombres)
        #Pon aqui los test que deseas realizar
        test_especulador_compra_seis_casas
        #test_especulador_intenta_comprar_nueve_casas
        #test_especulador_compra_seis_hoteles
        #test_especulador_intenta_comprar_nueve_hoteles
      end
    
    end
    
    MainTest.ejecutar_tests
  end
