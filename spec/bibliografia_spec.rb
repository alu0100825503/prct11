require "spec_helper.rb"
require "lib/bibliografia/definition.rb"

describe Bibliograph do
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
    end
    
  describe "# Almacenamiento del autor, título, etc" do
    it "Se almacena correctamente el(los) autor(es)" do
        @l1.autores.should eq(['Scott Chacon'])
    end    
    it "Se almacena correctamente el título" do
        @l1.titulo.should eq('Pro Git 2009th Edition') 
    end    
    it "Se almacena correctamente la fecha" do
        @l1.get_fecha.should eq('August 27, 2009')
    end
    it "Listado de autores" do
        @l1.get_autores.should eq('Chacon, S.') 
    end    
    it "Obtener título" do
       @l1.get_titulo.should eq('Pro Git 2009th Edition') 
    end 
    end    
    it "Obtener la fecha" do
       @l1.get_fecha.should eq('August 27, 2009') 
    end
    
    it "Comparar bibliografías" do
       expect(@p1 > @r1).to eq(true)   
       expect(@d1 < @l1).to eq(true)
       expect(@p1 > @d1).to eq (true)
    end    
  end

describe "# Clase Libro" do
        it "Se comprueba la pertenencia de un objeto a la clase Libro y su pertenencia a la jerarquía" do
            # @l1.instance_of?(Libro).should eq(true)
            @l1.instance_of?(Bibliograph).should eq(false)
        end
        it "Se comprueba la pertenencia a la jerarquía" do
            # @l1.is_a?(Libro).should eq(true)
           # @l1.is_a?(Bibliograph).should eq(true)
            @l1.is_a?(Articulo_periodico).should eq(false)
        end 
end

describe Articulo_periodico do
    before :each do
         @p1 = Articulo_periodico.new('Idiotas o ciudadanos') do
            autor 'Jesus Monedero' 
            fecha '29 junio 2014'
            periodico 'Diario Unidad'
            numeros_paginas '21-24'
        end
    end
    
    describe "# Clase Articulo_periodico" do
        it "Se comprueba la pertenencia de un objeto a la clase Articulo_periodico y su pertenencia a la jerarquía" do
            @p1.instance_of?(Articulo_periodico).should eq(true)
            @p1.instance_of?(Bibliograph).should eq(false)
        end
        it "Se comprueba la pertenencia a la jerarquía" do
            @p1.is_a?(Articulo_periodico).should eq(true)
            @p1.is_a?(Bibliograph).should eq(true)
        end    
    end    
end

describe Articulo_revista do
    before :each do
        @r1 = Articulo_revista.new('Documentos sobre la musica en la catedral de Las Palmas') do
            autor 'Lucas Torre'
            fecha '3 marzo 2006'
            revista 'El Museo Canario'
            paginas '27'
        end  
    end
    
    describe "# Clase Articulo_revista" do
        it "Se comprueba la pertenencia de un objeto a la clase Articulo_periodico y su pertenencia a la jerarquía" do
            @r1.instance_of?(Articulo_revista).should eq(true)
            @r1.instance_of?(Bibliograph).should eq(false)
        end
        it "Se comprueba la pertenencia a la jerarquía" do
            @r1.is_a?(Articulo_revista).should eq(true)
            @r1.is_a?(Bibliograph).should eq(true)
        end    
    end    
end

describe Documento_electronico do
    before :each do
        @d1 = Documento_electronico.new('Beyond the MLA handbook') do
            autor 'Andrew Harnack'
            fecha '4 abril 1997'
            tipo_medio 'en línea'
            editorial 'Chicago: The University of Chicago Press'
            via '<http://falcon.eku.edu/honors/ beyond-mla/>'
        end 
    end
    
    describe "# Clase Documento_electronico" do
        it "Se comprueba la pertenencia de un objeto a la clase Articulo_periodico y su pertenencia a la jerarquía" do
            @d1.instance_of?(Documento_electronico).should eq(true)
            @d1.instance_of?(Bibliograph).should eq(false)
        end
        it "Se comprueba la pertenencia a la jerarquía" do
            @d1.is_a?(Documento_electronico).should eq(true)
            @d1.is_a?(Bibliograph).should eq(true)
        end 
        
        
        #it "Probando el tipo" do 
           # expect(@d1.respond_to?).to 
        #end    
    end    
end