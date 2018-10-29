#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module ModeloQytetet
  
  class TituloPropiedad
    attr_reader :nombre,:hipotecada,:precio_compra,:alquiler_base,:factor_revalorizacion,:hipoteca_base,:precio_edificar,:num_hoteles,:num_casas
    attr_accessor :hipotecada, :propietario
    
    def initialize(nombre,precioCompra,alquilerBase,factorRevalorizacion,hipotecaBase,precioEdificar)
       @nombre=nombre
       @precio_compra=precioCompra
       @alquiler_base=alquilerBase
       @factor_revalorizacion=factorRevalorizacion
       @hipoteca_base=hipotecaBase
       @precio_edificar=precioEdificar
       @hipotecada=false
       @num_casas=0
       @num_hoteles=0
       @propietario=nil
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
      raise NotImplementedError
    end
    
    
    def cobrar_alquiler(coste)
      raise NotImplementedError
    end
    
    
    def edificar_casa
      raise NotImplementedError
    end
    
    
    def edificar_hotel
      raise NotImplementedError
    end

    
    def hipotecar
      raise NotImplementedError
    end
    
    
    def pagar_alquiler
      raise NotImplementedError
    end
    
    
    def propietario_encarcelado
      return (@propietario.encarcelado)
    end
    
    
    def tengo_propietario
      return (@propietario != nil)
    end
    
    
    def to_s
      return "Titulo{nombre: #{nombre},  hipotecada: #{hipotecada}, precioCompra: #{@precio_compra}, alquilerBase: #{@alquiler_base}, factorRevalorizacion: #{@factor_revalorizacion}, hipotecaBase: #{@hipoteca_base}, precioEdificar: #{@precio_edificar}, numHoteles: #{@num_hoteles}, numCasas: #{@num_casas}}\n"
    end
  
  end
  
end