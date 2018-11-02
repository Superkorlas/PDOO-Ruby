#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
# 
#encoding: utf-8

module ModeloQytetet
  
  class Sorpresa
    
    attr_accessor :texto
    attr_accessor :valor
    attr_accessor :tipo
    
    def initialize (texto, valor, tipo)
      @texto = texto
      @valor = valor
      @tipo = tipo
    end
    
    def to_s()
      return "Texto: #{texto} \n Valor: #{valor} \n Tipo: #{tipo} \n "
    end
    
  end
  
end
