# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'controlador_qytetet'

module VistatextualQytetet
  class VistaTextualQytetet
    def initialize
      @controlador = ControladorQytetet.instance
    end 
    
    def elegir_casilla(opcion_menu)
      lista = @controlador.obtener_casillas_validas(opcion_menu)
      
      if(lista.empty?)
        return -1
      else
        puts lista.to_s
        return leer_valor_correcto(lista)
      end
    end
    
    
    def leer_valor_correcto(valores_correctos)
      loop do
        input = gets.chomp
        if(valores_correctos.include?(input))
          return input
        else
          puts "valor incorrecto, pruebe de nuevo"
          STDOUT.flush
        end
      end
    end
    
    
    def elegir_operacion
      operaciones = @controlador.obtener_operaciones_juego_validas
      leer_valor_correcto(operaciones)
    end
    
    
    def obtener_nombre_jugadores
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
    
    
    def self.main
      ui = VistaTextual.new
      @controlador.nombre_jugadores = ui.obtener_nombre_jugadores
      operacion_elegida = casilla_elegida = 0
      
      loop do 
        operacion_elegida = ui.elegir_operacion
        necesita_elegir_casilla = @controlador.necesita_elegir_casilla(operacion_elegida)
        if(necesita_elegir_casilla)
          casilla_elegida = ui.elegir_casilla(operacion_elegida)
        end
        if(!necesita_elegir_casilla || casilla_elegida >= 0)
          puts controlador.realizar_operacion(opcion_elegida, casilla_elegida)
        end
      end
    end
  end
  
  VistaTextualQytetet.main
end
