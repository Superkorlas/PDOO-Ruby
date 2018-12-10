# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "singleton"
require_relative 'opcion_menu'
require_relative 'estado_juego'
require_relative 'metodo_salir_carcel'

module ControladorQytetet
  class ControladorQytetet
    include Singleton
    attr_accessor :nombre_jugadores, :modelo
    
    def initialize  
    end
    
    def obtener_operaciones_juego_validas
      opciones = Array.new
      
      case modelo.estadoJuego
        when EstadoJuego::JA_PREPARADO
          opciones << OpcionMenu.index(:JUGAR)
          opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
          opciones << OpcionMenu.index(:MOSTRARJUGADORES)
          opciones << OpcionMenu.index(:MOSTRARTABLERO)
          
        when EstadoJuego::JA_PUEDEGESTIONAR
          opciones << OpcionMenu.index(:PASARTURNO)
          opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
          opciones << OpcionMenu.index(:MOSTRARJUGADORES)
          opciones << OpcionMenu.index(:MOSTRARTABLERO)
          
        when EstadoJuego::JA_PUEDECOMPRARGESTIONAR
          opciones << OpcionMenu.index(:PASARTURNO)
          opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
          opciones << OpcionMenu.index(:MOSTRARJUGADORES)
          opciones << OpcionMenu.index(:MOSTRARTABLERO)
          
        when EstadoJuego::JA_ENCARCELADOCONOPCIONLIBERTAD
          opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
          opciones << OpcionMenu.index(:MOSTRARJUGADORES)
          opciones << OpcionMenu.index(:MOSTRARTABLERO)
          
        when EstadoJuego::JA_CONSORPRESA
          opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
          opciones << OpcionMenu.index(:MOSTRARJUGADORES)
          opciones << OpcionMenu.index(:MOSTRARTABLERO)
          
        when EstadoJuego::JA_ENCARCELADO
          opciones << OpcionMenu.index(:PASARTURNO)
          opciones << OpcionMenu.index(:MOSTRARJUGADORACTUAL)
          opciones << OpcionMenu.index(:MOSTRARJUGADORES)
          opciones << OpcionMenu.index(:MOSTRARTABLERO)
          
        when EstadoJuego::ALGUNJUGADORENBANCARROTA
           
      end
    end
    
    
    def necesita_elegir_casilla(opcion_menu)
      operaciones_casilla = [:HIPOTECARPROPIEDAD, :CANCELARHIPOTECA, :EDIFICARCASA, :EDIFICARHOTEL, :VENDERPROPIEDAD]
      return operaciones_casilla.include?(OpcionMenu.at(opcion_menu))
    end
    
    
    def obtener_casillas_validas(opcion_menu)
      operacion = OpcionMenu.at(opcion_menu)
      case operacion
        when (:HIPOTECARPROPIEDAD || :EDIFICARCASA || :EDIFICARHOTEL || :VENDERPROPIEDAD)
          return @modelo.jugador_actual.obtener_propiedades_jugador_segun_estado_hipoteca(false)
        when (:CANCELARHIPOTECA)
          return @modelo.jugador_actual.obtener_propiedades_jugador_segun_estado_hipoteca(true)
      end
    end
    
    
    def realizar_operacion(opcion_elegida, casilla_elegida)
      operacion = OpcionMenu.at(opcion_elegida)
      case operacion
      when :INICIARJUEGO
        @modelo.inicializar_juego(@nombre_jugadores)
        puts "\nEmpieza el Juego\n"
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
        puts "\nHipotecada:  #{@modelo.obtener_casilla_numero(casilla_elegida).titulo.nombre}\n"
      when :CANCELARHIPOTECA
        @modelo.cancelar_hipoteca(casilla_elegida)
        puts "\nCancelada hipoteca de #{@modelo.obtener_casilla_numero(casilla_elegida).titulo.nombre}\n"
      when :EDIFICARCASA
        @modelo.edificar_casa(@modelo.obtener_casilla_numero(casilla_elegida).titulo)
        puts "\nEdificada casa en #{@modelo.obtener_casilla_numero(casilla_elegida).titulo.nombre}\n"
      when :EDIFICARHOTEL
        @modelo.edificar_hotel(@modelo.obtener_casilla_numero(casilla_elegida).titulo)
        puts "\nEdificado hotel en #{@modelo.obtener_casilla_numero(casilla_elegida).titulo.nombre}\n"
      when :VENDERPROPIEDAD
        @modelo.vender_propiedad(casilla_elegida)
        puts "\nVendida #{@modelo.obtener_casilla_numero(casilla_elegida).titulo.nombre}\n"
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
