require './spec_helper.rb'
require '../lib/linkedlist.rb'
require '../lib/bibliografia/reference.rb'

describe Linkedlist do
    before :each do
        @b1 = Bibliograph.new('Scott Chacon', 'Pro Git 2009th Edition', 'August 27, 2009')
        @l1 = Libro.new('Scott Chacon', 'Pro Git 2009th Edition', 'Pro', 'Apress', '2009 edition', 'August 27, 2009', ['978-1430218333', '1430218339'])
        @p1 = Articulo_periodico.new('Jesus Monedero', 'Idiotas o ciudadanos', '29 junio 2014', 'Diario Unidad', [21, 24])
        @r1 = Articulo_revista.new('Lucas Torre Champsour', 'Documentos sobre la música en la catedral de Las Palmas', 'El Museo Canario', '3 marzo 2006', [353,454])
        @d1 = Documento_electronico.new('Andrew Harnack', 'Beyond the MLA handbook', 'en línea', 'Chicago: The University of Chicago Press', '4 abril 1997', '<http://falcon.eku.edu/honors/ beyond-mla/>') 
    
        @lista = Linkedlist.new
    end
    
    it "Se almacenan correctamente las referencias en la lista" do
        @lista.insert_end(@l1) 
        @lista.insert_end(@p1)
        @lista.insert_end(@r1)
        
        expect(@lista.extract_begin).to eq @l1
    end    
    
    it "Se muestra correctamente la información de un libro" do
        expect(@l1.to_s).to eq 'Chacon, S. (2009). Pro Git 2009th Edition (2009 edition). Apress'
    end    
    
    it "Se muestra correctamente la información de un artículo de periódico" do
        expect(@p1.to_s).to eq 'Monedero, J. (29 junio 2014). Idiotas o ciudadanos. Diario Unidad. [21, 24]'
    end  
    
    it "Se muestra correctamente la información de un artículo de revista" do
        expect(@r1.to_s).to eq 'Torre, L. (2006). Documentos sobre la música en la catedral de Las Palmas. En El Museo Canario (101 páginas).'
    end     
    
end        