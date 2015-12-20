require 'spec_helper.rb'
require './lib/linkedlist.rb'
require './lib/bibliografia/definition.rb'

describe Linkedlist do
    before :each do
        @l1 = Libro.new('Pro Git 2009th Edition') do
            autor 'Scott Chacon'
            fecha 'August 27, 2009'
            serie 'Pro'
            editorial 'Apress'
            edicion '2009 edition'
            isbn '978-1430218333'
        end 
        
        @r1 = Articulo_revista.new('Documentos sobre la musica en la catedral de Las Palmas') do
            autor 'Lucas Torre'
            fecha '3 marzo 2006'
            revista 'El Museo Canario'
            paginas '27'
        end    
        
        @p1 = Articulo_periodico.new('Idiotas o ciudadanos') do
            autor 'Jesus Monedero' 
            fecha '29 junio 2014'
            periodico 'Diario Unidad'
            numeros_paginas '21-24'
        end    
        
        @d1 = Documento_electronico.new('Beyond the MLA handbook') do
            autor 'Andrew Harnack'
            fecha '4 abril 1997'
            tipo_medio 'en línea'
            editorial 'Chicago: The University of Chicago Press'
            via '<http://falcon.eku.edu/honors/ beyond-mla/>'
        end    
        
        @lista = Linkedlist.new
    end
    
    it "Se almacenan correctamente las referencias en la lista" do
        @lista.insert_end(@l1) 
        @lista.insert_end(@p1)
        @lista.insert_end(@r1)
        
        expect(@lista.extract_begin).to eq @l1
    end    
    
    it "Se muestra correctamente la información de un libro en formato APA" do
        expect(@l1.to_s).to eq 'Chacon, S. (2009). Pro Git 2009th Edition (2009 edition). Apress'
    end    
    
    it "Se muestra correctamente la información de un artículo de periódico en formato APA" do
        expect(@p1.to_s).to eq 'Monedero, J. (29 junio 2014). Idiotas o ciudadanos. Diario Unidad. [21-24]'
    end  
    
    it "Se muestra correctamente la información de un artículo de revista en formato APA" do
        expect(@r1.to_s).to eq 'Torre, L. (2006). Documentos Sobre La Musica En La Catedral De Las Palmas. En El Museo Canario (27 páginas).'
    end     
    
    it "Se muestra correctamente la información de un documento electrónico APA" do
        expect(@d1.to_s).to eq 'Harnack, A. (1997). Beyond the MLA handbook [en línea]. Ed: Chicago: The University of Chicago Press. Disponible en: <http://falcon.eku.edu/honors/ beyond-mla/>'
    end    
    
    it "Se pueden ordenar las referencias de acuerdo a su orden alfabético por primer apellido" do
        @lista.insert_end(@r1)
        @lista.insert_end(@p1)
        @lista.insert_end(@l1)
        
        expect(@lista.sort).to eq [@r1,@l1,@p1]
    end   
    
    it "Las referencias son comparables mediante el apellido del primer autor" do
        @lista.insert_end(@b1)
        @lista.insert_end(@l1)
        @lista.insert_end(@p1)
        @lista.insert_end(@r1)
        @lista.insert_end(@d1)
        
        expect(@l1 > @p1).to eq false
        expect(@r1 < @d1).to eq false
        expect(@d1 < @p1).to eq true
    end    
end     