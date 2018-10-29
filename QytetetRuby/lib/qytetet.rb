#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  require_relative "jugador"
  require_relative "sorpresa"
  require_relative "tipo_sorpresa"
  require_relative "estado_juego"
  require "singleton"
  
  class Qytetet
    include Singleton
    
    attr_reader :mazo, :jugadores, :max_jugadores, :num_sorpresas, :num_casillas, :precio_libertad, :saldo_salida, :dado, :jugador_actual, :carta_actual
    attr_accessor :tablero, :estadoJuego
    
    def initialize
      @mazo=Array.new
      @jugadores=Array.new
      @jugador_actual = nil
      @carta_actual = nil
      @estado_juego = nil
      
      @@max_jugadores = 4
      @@num_sorpresas = 20
      @@num_casillas = 20
      @@precio_libertad = 200
      @@saldo_salida = 1000
    end

    
    def actuar_si_en_casilla_edificable
      debo_pagar = @jugador_actual.debo_pagar_alquiler
      if debo_pagar
          @jugador_actual.pagar_alquiler
      end
      casilla = obtener_casilla_jugador_actual
      tengo_propietario = casilla.tengo_propietario
      if tengo_propietario
        @estado_juego = EstadoJuego::JA_PUEDEGESTIONAR
      else
        @estado_juego = EstadoJuego::JA_PUEDECOMPRAROGESTIONAR
      end
    end
    
    
    def actuar_si_en_casilla_no_edificable
      raise NotImplementederror
    end
    
    
    def aplicar_sorpresa
      @estado_juego = EstadoJuego::JA_PUEDEGESTIONAR
      if @carta_actual.tipo == TipoSorpresa::SALIRCARCEL
        @jugador_actual.carta_libertad = @carta_actual
      else
        @mazo<< @carta_actual
      end
      
      if @carta_actual.tipo == TipoSorpresa::PAGARCOBRAR
        @jugador_actual.modificar_saldo(@carta_actual.valor)
        if @jugador_actual.saldo < 0 
          @estado_juego = EstadoJuego::ALGUNJUGADORENBANCARROTA
        end
      elsif @carta_actual.tipo == TipoSorpresa::IRACASILLA
        valor = @carta_Actual.valor
        casilla_carcel = @tablero.es_casilla_carcel(valor)
        if casilla_carcel == true
          encarcelar_jugador
        else
          mover(valor)
        end
      elsif @carta_actual.tipo == TipoSorpresa::PORCASAHOTEL
        cantidad = @carta_actual.valor
        numero_total = @jugador_actual.cuantas_casas_hoteles_tengo
        @jugador_actual.modificar_saldo(cantidad * numero_total)
        if @jugador_actual.saldo < 0 
          @estado_juego = EstadoJuego::ALGUNJUGADORENBANCARROTA
        end
      elsif @carta_actual.tipo == TipoSorpresa::PORJUGADOR
        for jugador in @jugadores
          if jugador != @jugador_actual
            jugador.modificar_saldo(@carta_actual.valor)
            if @jugador_actual.saldo < 0 
              @estado_juego = EstadoJuego::ALGUNJUGADORENBANCARROTA
            end
          end
          @jugador_actual.modificar_saldo(-@carta_actual.valor)
          if @jugador_actual.saldo < 0 
            @estado_juego = EstadoJuego::ALGUNJUGADORENBANCARROTA
          end
        end
      end
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
      return @dado.valor
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
      desplazamiento = tirar_dado
      casilla_destino = @tablero.obtener_casilla_final(@jugador_actual.casilla_actual, desplazamiento)
      mover(casilla_destino.numero_casilla)
      return desplazamiento
    end
    
    
    def mover(num_casilla_destino)
      raise NotImplementedError
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
      propiedades = Array.new
      propiedades = @jugador_actual.obtener_propiedades(estado_hipoteca)
      resultado = Array.new
      for propiedad in propiedades
        for casilla in @tablero.casillas
          if casilla.tipo == TipoCasilla::CALLE
            resultado<< casilla.numero_casilla
          end
        end
      end
      return resultado
    end
    
    def jugador_actual_en_calle_libre
      return !(@jugador_actual.casilla_actual.titulo.tengo_propietario)
    end
    
    def jugador_actual_encarcelado
      return @jugador_actual.encarcelado
    end
    
    def obtener_ranking
      @jugadores = @jugadores.sort
    end
    
    
    def obtener_saldo_jugador_actual
      return @jugador_actual.saldo
    end
    
    
    def salida_jugadores
      for jugador in @jugadores
        jugador.casilla_actual = 0
      end
      num_aleatorio = rand(@jugadores.size)
      @jugador_actual = @jugadores.at(num_aleatorio)
      @estado_juego  = EstadoJuego::JA_PREPARADO
    end
    
    def set_carta_actual (carta)
      @carta_actual = carta
    end
    
    def set_estado_juego (estado)
      @estado_juego = estado
    end
    
    
    def siguiente_jugador
      num_jugador = 0
      num = 0
      for jugador in @jugadores
        if (jugador == @jugador_actual)
          num_jugador = num
        end
        num += 1
      end
      @jugador_actual = @jugadores.at((num_jugador+1)%@jugadores.size)
      #Actualizamos el estado del juego
      if (@jugador.encarcelado)
        @estado_juego = EstadoJuego::JA_ENCARCELADOCONOPCIONDELIBERTAD
      else
        @estado_juego = EstadoJuego::JA_PREPARADO
      end
    end
    
    
    def tirar_dado
      return @dado.tirar
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
      
      retorno = retorno + ",\n jugadorActual=#{@jugador_actual},\n dado=#{@dado},\n estado juego=#{@estado_juego}}"
    end
        
    private :encarcelar_jugador, :inicializar_cartas_sorpresa, :inicializar_jugadores, :inicializar_tablero, :set_carta_actual, :set_estado_juego, :salida_jugadores
    
  end
end
