# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module InterfazUsuarioQytetet
  class InterfazUsuarioQytetet

    # Funcion para obtener el nombre de los jugadores, devuelve un array de string
    def self.get_nombre_jugadores
      nombres = Array.new

      puts "Introduce el numero de jugadores [2 a 4]: "
      STDOUT.flush
      num = leer_valor_correcto(["2","3","4"]).to_i

      puts "Habra " + num.to_s + " jugadores."

      for i in 0..num-1
        puts "Jugador #{(i+1).to_s}: "
        STDOUT.flush
        nombre = leer_valor_correcto
        nombres<< nombre
      end
      return nombres
    end

    # determina si el valor introducido pertenece a los valores dados, y lo devuelve
    def self.leer_valor_correcto(valores_correctos = nil)
      # Leemos el string introducido quitandole el caracter final(salto de linea)
      str = gets.chomp

      if(!valores_correctos.nil?)
        while(!valores_correctos.include?(str))
          puts "El valor introducido no es correcto, pruebe de nuevo\n"
          str = gets.chomp
        end
      end

      return str
    end      


  end
end
