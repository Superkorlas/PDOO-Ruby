#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module ModeloQytetet
  
  class TituloPropiedad
    attr_reader :nombre,:hipotecada,:precioCompra,:alquilerBase,:factorRevalorizacion,:hipotecaBase,:precioEdificar,:numHoteles,:numCasas
    attr_writer :hipotecada, :propietario
    
    def initialize(nombre,precioCompra,alquilerBase,factorRevalorizacion,hipotecaBase,precioEdificar)
       @nombre=nombre
       @precioCompra=precioCompra
       @alquilerBase=alquilerBase
       @factorRevalorizacion=factorRevalorizacion
       @hipotecaBase=hipotecaBase
       @precioEdificar=precioEdificar
       @hipotecada=false
       @numCasas=0
       @numHoteles=0
    end
    
    
    def calcular_coste_cancelar
      raise NotImplementedError
    end    
    
    
    def calcular_coste_hipotecar
      raise NotImplementedError
    end
    
    
    def calcular_importe_alquiler
      raise NotImplementedError
    end
    
    
    def calcular_precio_venta
      raise NotImplementedError
    end
    
    
    def cancelar_hipoteca
      
    end
    
    
    def cobrar_alquiler(coste)
      
    end
    
    
    def edificar_casa
      
    end
    
    
    def edificar_hotel
      
    end

    
    def hipotecar
      raise NotImplementedError
    end
    
    
    def pagar_alquiler
      raise NotImplementedError
    end
    
    
    def propietario_encarcelado
      raise NotImplementedError
    end
    
    
    def tengo_propietario
      raise NotImplementedError
    end
    
    
    def to_s
      return "Titulo{nombre: #{nombre},  hipotecada: #{hipotecada}, precioCompra: #{precioCompra}, alquilerBase: #{alquilerBase}, factorRevalorizacion: #{factorRevalorizacion}, hipotecaBase: #{hipotecaBase}, precioEdificar: #{precioEdificar}, numHoteles: #{numHoteles}, numCasas: #{numCasas}}\n"
    end
  
  end
  
end