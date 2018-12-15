# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "singleton"
require_relative 'opcion_menu'
require_relative 'estado_juego'
require_relative 'qytetet'
require_relative 'metodo_salir_carcel'

module ControladorQytetet
  class Controladorqytetet
    include Singleton
    attr_accessor :nombre_jugadores, :modelo
    
    def initialize  
      @modelo = ModeloQytetet::Qytetet.instance
    end
    
    def obtener_operaciones_juego_validas
      opciones = Array.new
      puts "\nestado juego: #{@modelo.estado_juego.inspect}\n"
      if(@modelo.estado_juego == nil)
        opciones << OpcionMenu.index(:INICIARJUEGO)
      else
        case @modelo.estado_juego
          when ModeloQytetet::EstadoJuego::JA_PREPARADO
            opciones << OpcionMenu.index(:JUGAR)
            opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
            opciones << OpcionMenu.index(:MOSTRARJUGADORES)
            opciones << OpcionMenu.index(:MOSTRARTABLERO)

          when ModeloQytetet::EstadoJuego::JA_PUEDEGESTIONAR
            opciones << OpcionMenu.index(:PASARTURNO)
            if(!@modelo.obtener_propiedades_jugador_segun_estado_hipoteca(false).empty?)
              opciones << OpcionMenu.index(:VENDERPROPIEDAD)
              opciones << OpcionMenu.index(:HIPOTECARPROPIEDAD)
              opciones << OpcionMenu.index(:EDIFICARCASA)
              opciones << OpcionMenu.index(:EDIFICARHOTEL)
            end
            if(!@modelo.obtener_propiedades_jugador_segun_estado_hipoteca(true).empty?)
              opciones << OpcionMenu.index(:CANCELARHIPOTECA)
            end
            opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
            opciones << OpcionMenu.index(:MOSTRARJUGADORES)
            opciones << OpcionMenu.index(:MOSTRARTABLERO)

          when ModeloQytetet::EstadoJuego::JA_PUEDECOMPRAROGESTIONAR
            opciones << OpcionMenu.index(:PASARTURNO)
            opciones << OpcionMenu.index(:COMPRARTITULOPROPIEDAD)
            if(!@modelo.obtener_propiedades_jugador_segun_estado_hipoteca(false).empty?)
              opciones << OpcionMenu.index(:VENDERPROPIEDAD)
              opciones << OpcionMenu.index(:HIPOTECARPROPIEDAD)
              opciones << OpcionMenu.index(:EDIFICARCASA)
              opciones << OpcionMenu.index(:EDIFICARHOTEL)
            end
            if(!@modelo.obtener_propiedades_jugador_segun_estado_hipoteca(true).empty?)
              opciones << OpcionMenu.index(:CANCELARHIPOTECA)
            end
            opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
            opciones << OpcionMenu.index(:MOSTRARJUGADORES)
            opciones << OpcionMenu.index(:MOSTRARTABLERO)

          when ModeloQytetet::EstadoJuego::JA_ENCARCELADOCONOPCIONDELIBERTAD
            opciones << OpcionMenu.index(:INTENTARSALIRCARCELPAGANDOLIBERTAD)
            opciones << OpcionMenu.index(:INTENTARSALIRCARCELTIRANDODADO)
            opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
            opciones << OpcionMenu.index(:MOSTRARJUGADORES)
            opciones << OpcionMenu.index(:MOSTRARTABLERO)

          when ModeloQytetet::EstadoJuego::JA_CONSORPRESA
            opciones << OpcionMenu.index(:APLICARSORPRESA)
            opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
            opciones << OpcionMenu.index(:MOSTRARJUGADORES)
            opciones << OpcionMenu.index(:MOSTRARTABLERO)

          when ModeloQytetet::EstadoJuego::JA_ENCARCELADO
            opciones << OpcionMenu.index(:PASARTURNO)
            opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
            opciones << OpcionMenu.index(:MOSTRARJUGADORES)
            opciones << OpcionMenu.index(:MOSTRARTABLERO)

          when ModeloQytetet::EstadoJuego::ALGUNJUGADORENBANCARROTA
            opciones << OpcionMenu.index(:OBTENERRANKING)
          else
            opciones << OpcionMenu.index(:INICIARJUEGO)           
        end
      end
      return opciones
    end
    
    
    def necesita_elegir_casilla(opcion_menu)
      operaciones_casilla = [:HIPOTECARPROPIEDAD, :CANCELARHIPOTECA, :EDIFICARCASA, :EDIFICARHOTEL, :VENDERPROPIEDAD]
      return operaciones_casilla.include?(OpcionMenu.at(opcion_menu))
    end
    
    
    def obtener_casillas_validas(opcion_menu)
      operacion = OpcionMenu.at(opcion_menu)
      case operacion
        when :HIPOTECARPROPIEDAD  
          return @modelo.obtener_propiedades_jugador_segun_estado_hipoteca(false)
        when :EDIFICARCASA
          return @modelo.obtener_propiedades_jugador_segun_estado_hipoteca(false)
        when :EDIFICARHOTEL
          return @modelo.obtener_propiedades_jugador_segun_estado_hipoteca(false)
        when :VENDERPROPIEDAD
          return @modelo.obtener_propiedades_jugador_segun_estado_hipoteca(false)
        when :CANCELARHIPOTECA
          return @modelo.obtener_propiedades_jugador_segun_estado_hipoteca(true)
      end
    end
    
    
    def realizar_operacion(opcion_elegida, casilla_elegida)
      operacion = OpcionMenu.at(opcion_elegida)
      case operacion
      when :INICIARJUEGO
        @modelo.inicializar_juego(@nombre_jugadores)
        puts "\nQue empiece el juego!\n"
        puts "\n----> TURNO DE #{@modelo.jugador_actual.nombre} <----\n"
      when :JUGAR
        @modelo.jugar
        puts "\nHas sacado un #{@modelo.valor_dado}, por tanto te vas a la casilla #{@modelo.jugador_actual.casilla_actual.to_s}\n"
      when :APLICARSORPRESA
        carta = @modelo.carta_actual
        @modelo.aplicar_sorpresa
        puts "\nSe ha aplicado la sorpresa: #{carta.texto}\n"
      when :INTENTARSALIRCARCELPAGANDOLIBERTAD
        exito = @modelo.intentar_salir_carcel(MetodoSalirCarcel::PAGANDOLIBERTAD)
        puts "\nHas salido de la carcel? #{exito}\n"
      when :INTENTARSALIRCARCELTIRANDODADO
        exito = @modelo.intentar_salir_carcel(MetodoSalirCarcel::TIRANDODADO)
        puts "\nHas podido salir? #{exito}\n"
      when :COMPRARTITULOPROPIEDAD
        exito = @modelo.comprar_titulo_propiedad
        puts "\nHas podido comprarlo? #{exito}\n"
      when :HIPOTECARPROPIEDAD
        @modelo.hipotecar_propiedad(casilla_elegida)
        puts "\nHipotecada:  #{@modelo.tablero.obtener_casilla_numero(casilla_elegida).titulo.nombre}\n"
      when :CANCELARHIPOTECA
        @modelo.cancelar_hipoteca(casilla_elegida)
        puts "\nCancelada hipoteca de #{@modelo.tablero.obtener_casilla_numero(casilla_elegida).titulo.nombre}\n"
      when :EDIFICARCASA
        @modelo.edificar_casa(casilla_elegida)
        puts "\nEdificada casa en #{@modelo.tablero.obtener_casilla_numero(casilla_elegida).titulo.nombre}\n"
      when :EDIFICARHOTEL
        @modelo.edificar_hotel(casilla_elegida)
        puts "\nEdificado hotel en #{@modelo.tablero.obtener_casilla_numero(casilla_elegida).titulo.nombre}\n"
      when :VENDERPROPIEDAD
        @modelo.vender_propiedad(casilla_elegida)
        puts "\nVendida #{@modelo.tablero.obtener_casilla_numero(casilla_elegida).titulo.nombre}\n"
      when :PASARTURNO
        @modelo.siguiente_jugador
        puts "\n----> TURNO DE #{@modelo.jugador_actual.nombre} <----\n"
      when :OBTENERRANKING
        @modelo.obtener_ranking   # Falta ponerlo bien
        puts "\nRanking(?)\n"
      when :TERMINARJUEGO
        puts "El juego termino por un ragequit" # Falta ponerlo bien
        while(true)
        end
      when :MOSTRARJUGADORACTUAL
        puts @modelo.jugador_actual.to_s
      when :MOSTRARJUGADORES
        puts @modelo.jugadores.join("\n")
      when :MOSTRARTABLERO
        puts @modelo.tablero.to_s
      else
        puts "\n\n-->Operacion no valida(#{operacion}, #{opcion_elegida}), algo ha salido mal<--\n\n"
      end
    end
    
  end
end
