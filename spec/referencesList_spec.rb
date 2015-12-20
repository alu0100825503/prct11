require 'spec_helper.rb'
require './lib/linkedlist.rb'
require './lib/bibliografia/definition.rb'
=begin
describe Linkedlist do
    before :each do
        @b1 = Bibliograph.new(['Scott Chacon'], 'Pro Git 2009th Edition', 'August 27, 2009')
        @l1 = Libro.new(['Scott Chacon', 'William Shakespeare'], 'Pro Git 2009th Edition', 'Pro', 'Apress', '2009 edition', 'August 27, 2008', ['978-1430218333', '1430218339'])
        @p1 = Articulo_periodico.new(['Jesus Monedero'], 'Idiotas o ciudadanos', '29 junio 2014', 'Diario Unidad', [21, 24])
        @r1 = Articulo_revista.new(['Lucas Torre Champsour'], 'Documentos sobre la musica en la catedral de Las Palmas', 'El Museo Canario', '3 marzo 2006', [353,454])
        @d1 = Documento_electronico.new(['Andrew Harnack'], 'Beyond the MLA handbook', 'en línea', 'Chicago: The University of Chicago Press', '4 abril 1997', '<http://falcon.eku.edu/honors/ beyond-mla/>') 
    
        @lista = Linkedlist.new
    end
    
    it "Se almacenan correctamente las referencias en la lista" do
        @lista.insert_end(@l1) 
        @lista.insert_end(@p1)
        @lista.insert_end(@r1)
        
        expect(@lista.extract_begin).to eq @l1
    end    
    
    it "Se muestra correctamente la información de un libro en formato APA" do
        expect(@l1.to_s).to eq 'Chacon, S. & Shakespeare, W. (2008). Pro Git 2009th Edition (2009 edition). Apress'
    end    
    
    it "Se muestra correctamente la información de un artículo de periódico en formato APA" do
        expect(@p1.to_s).to eq 'Monedero, J. (29 junio 2014). Idiotas o ciudadanos. Diario Unidad. [21, 24]'
    end  
    
    it "Se muestra correctamente la información de un artículo de revista en formato APA" do
        expect(@r1.to_s).to eq 'Torre, L. (2006). Documentos Sobre La Musica En La Catedral De Las Palmas. En El Museo Canario (101 páginas).'
    end     
    
    it "Se muestra correctamente la información de un documento electrónico APA" do
        expect(@d1.to_s).to eq 'Harnack, A. (1997). Beyond the MLA handbook [en línea]. Ed: Chicago: The University of Chicago Press. Disponible en: <http://falcon.eku.edu/honors/ beyond-mla/>'
    end    
    
    it "Se pueden ordenar las referencias de acuerdo a su orden alfabético por primer apellido" do
        @lista.insert_end(@r1)
        @lista.insert_end(@p1)
        @lista.insert_end(@l1)
        
        expect(@lista.sort).to eq [@l1,@p1,@r1]
    end   
    
    it "Las referencias son comparables mediante el apellido del primer autor" do
        @lista.insert_end(@b1)
        @lista.insert_end(@l1)
        @lista.insert_end(@p1)
        @lista.insert_end(@r1)
        @lista.insert_end(@d1)
        
        expect(@b1 > @l1).to eq true    # por tener el mismo autor, se compara por el año
        expect(@l1 > @p1).to eq false
        expect(@r1 < @d1).to eq false
        expect(@d1 < @p1).to eq true
    end    
end     
=end