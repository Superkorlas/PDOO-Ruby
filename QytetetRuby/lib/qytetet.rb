#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  require_relative "jugador"
  require_relative "sorpresa"
  require_relative "tipo_sorpresa"
  require "singleton"
  
  class Qytetet
    include Singleton
    
    attr_reader :mazo, :jugadores, :max_jugadores, :num_sorpresas, :num_casillas, :precio_libertad, :saldo_salida, :dado, :jugador_actual
    attr_accessor :tablero #, :carta_actual
    
    def initialize
      @mazo=Array.new
      @jugadores=Array.new
      @carta_actual = nil
      
      @@max_jugadores = 4
      @@num_sorpresas = 20
      @@num_casillas = 20
      @@precio_libertad = 200
      @@saldo_salida = 1000
      
      #inicializar_tablero
    end

    
    def actuar_si_en_casilla_edificable
      
    end
    
    
    def actuar_si_en_casilla_no_edificable
      
    end
    
    
    def aplicar_sorpresa
      
    end

    
    def cancelar_hipoteca(numero_casilla)
      raise NotImplementederror
    end
    
    
    def comprar_titulo_propiedad
      raise NotImplementedError
    end
    
    
    def edificar_casa(numero_casilla)
      raise NotImplementedError
    end
    
    
    def edificar_hotel(numero_casilla)
      raise NotImplementedError
    end
    
    
    def encarcelar_jugador
      
    end
    
    
    def valor_dado
      raise NotImplementedError
    end
    
    
    def hipotecar_propiedad(numero_casilla)
    
    end
    
    
    def inicializar_cartas_sorpresa    
      mazo<< Sorpresa.new("De vuelta al pricipio, vuelves a la casilla de salida", 0, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("Que suerte, te vas a la carcel", 0, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("Poca broma, te vas a la ultima casilla del juego", 0, TipoSorpresa::IRACASILLA)
      mazo<< Sorpresa.new("Felicidades maquina, recibes dinero de todos por tu cumple", 50, TipoSorpresa::PAGARCOBRAR)
      mazo<< Sorpresa.new("Vaya, te toca pagar a todos por moroso", 100, TipoSorpresa::PAGARCOBRAR)
      mazo<< Sorpresa.new("Al margen de la ley", 0, TipoSorpresa::SALIRCARCEL)
      mazo<< Sorpresa.new("Todos te pagan", 100, TipoSorpresa::PORJUGADOR)
      mazo<< Sorpresa.new("Debes pagar tus deudas con el resto", 50, TipoSorpresa::PORJUGADOR)
      mazo<< Sorpresa.new("¡Tus casas y hoteles generan beneficios!", 100, TipoSorpresa::PORCASAHOTEL)
      mazo<< Sorpresa.new("Te toca pagar impuesto por tus casas y hoteles", 200, TipoSorpresa::PORCASAHOTEL)

    end
    
    
    def inicializar_juego(nombres)
      inicializar_jugadores(nombres)
      inicializar_tablero()
      inicializar_cartas_sorpresa()
    end
    
    
    def inicializar_jugadores(nombres)
      for nombre in nombres do
        @jugadores<< Jugador.new(nombre)
      end
    end
    
        
    def inicializar_tablero
      @tablero=Tablero.new
    end
    
    
    def intentar_salir_carcel(metodo)
      raise NotImplementedError
    end
    
    
    def jugar
      
    end
    
    
    def mover(num_casilla_destino)
      
    end
    
    
    def obtener_casilla_jugador_actual
      raise NotImplementedError
    end
    
    
    def obtener_casillas_tablero
      raise NotImplementedError
    end
    
    
    def obtener_propiedades_jugador
      raise NotImplementedError
    end
    
    
    def obtener_propiedades_jugador_segun_estado_hipoteca(estado_hipoteca)
      raise NotImplementedError
    end
    
    
    def obtener_ranking
      
    end
    
    
    def obtener_saldo_jugador_actual
      raise NotImplementedError
    end
    
    
    def salida_jugadores
      
    end
    
    def set_carta_actual (carta)
      @carta_actual = carta
    end
    
    
    def siguiente_jugador
      
    end
    
    
    def tirar_dado
      raise NotImplementedError
    end
    
    
    def vender_propiedad(num_casilla)
      raise NotImplementedError
    end
    
    def to_s
      retorno = "Qytetet{ mazo="
      
      for carta in @mazo
        retorno = retorno + carta.to_s
      end
      
      retorno = retorno + ",\n tablero=#{@tablero},\n cartaActual=#{@carta_actual},\njugadores="
      
      for jugador in @jugadores
        retorno = retorno + jugador.to_s
      end
      
      retorno = retorno + ",\n jugadorActual=#{@jugador_actual},\n dado=#{@dado}}"
    end
        
    private :encarcelar_jugador, :inicializar_cartas_sorpresa, :inicializar_jugadores, :inicializar_tablero, :salida_jugadores, :set_carta_actual
    
  end
end
