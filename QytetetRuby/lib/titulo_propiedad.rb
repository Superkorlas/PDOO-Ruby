# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module ModeloQytetet
  
  class TituloPropiedad
    attr_reader :nombre,:hipotecada,:precioCompra,:alquilerBase,:factorRevalorizacion,:hipotecaBase,:precioEdificar,:numHoteles,:numCasas
    attr_writer :hipotecada
    
    def initialize(nombre,precioCompra,alquilerBase,factorRevalorizacion,hipotecaBase,precioEdificar)
       @nombre=nombre
       @precioCompra=precioCompra
       @alquilerBase=alquilerBase
       @factorRevalorizacion=factorRevalorizacion
       @hipotecaBase=hipotecaBase
       
       @hipotecada=false
       @numcasas=0
       @numHoteles=0
    end
    
    def to_s
      return "nombre: #{nombre}, hipotecada: #{hipotecada}, precioCompra: #{precioCompra}, alquilerBase: #{alquilerBase}, factorRevalorizacion: #{factorRevalorizacion}, hipotecaBase: #{hiptecaBase}, precioEdificar: #{precioEdificar}, numHoteles: #{numHoteles}, numCasas: #{numCasas}\n"
    end
  
  end
  
end