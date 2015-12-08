require "spec_helper.rb"
require "./lib/bibliografia/reference.rb"

describe Bibliograph do
  before :each do
    @b1 = Bibliograph.new('Scott Chacon', 'Pro Git 2009th Edition', 'August 27, 2009')
    @l1 = Libro.new('Scott Chacon', 'Pro Git 2009th Edition', 'Pro', 'Apress', '2009 edition', 'August 27, 2009', ['978-1430218333', '1430218339'])
    @p1 = Articulo_periodico.new('Jesús Monedero', 'Idiotas o ciudadanos', '29 junio 2014', 'Diario Unidad', [21, 24])
    @r1 = Articulo_revista.new('Lucas Torre', 'Documentos sobre la música en la catedral de Las Palmas', 'El Museo Canario', '3 marzo 2006', [353,454])
    @d1 = Documento_electronico.new('Andrew Harnack', 'Beyond the MLA handbook', 'en línea', 'Chicago: The University of Chicago Press', '4 abril 1997', '<http://falcon.eku.edu/honors/ beyond-mla/>') 
  end    
    
  describe "# Almacenamiento del autor, título, etc" do
    it "Se almacena correctamente el(los) autor(es)" do
        @b1.autores.should eq('Scott Chacon')
    end    
    it "Se almacena correctamente el título" do
        @b1.titulo.should eq('Pro Git 2009th Edition') 
    end    
    it "Se almacena correctamente la fecha" do
        @b1.fecha.should eq('August 27, 2009')
    end
    it "Listado de autores" do
        @b1.get_autores.should eq('Scott Chacon') 
    end    
    it "Obtener título" do
       @b1.get_titulo.should eq('Pro Git 2009th Edition') 
    end 
    end    
    it "Obtener la fecha" do
       @b1.get_fecha.should eq('August 27, 2009') 
    end
    
    it "Comparar bibliografías" do
       expect(@b1 > @l1).to eq(false)   
       expect(@b1 < @p1).to eq(true)    
       expect(@p1 > @r1).to eq(true)   
       expect(@d1 > @l1).to eq(true)
       expect(@b1 < @r1).to eq (true)
       expect(@p1 > @d1).to eq (true)
       expect(@b1 == @l1).to eq(true)
    end    
end

describe Libro do
    before :each do
        @l1 = Libro.new('Scott Chacon', 'Pro Git 2009th Edition', 'Pro', 'Apress', '2009 edition', 'August 27, 2009', ['978-1430218333', '1430218339'])
    end
    
    describe "# Clase Libro" do
        it "Se comprueba la pertenencia de un objeto a la clase Libro y su pertenencia a la jerarquía" do
            @l1.instance_of?(Libro).should eq(true)
            @l1.instance_of?(Bibliograph).should eq(false)
        end
        it "Se comprueba la pertenencia a la jerarquía" do
            @l1.is_a?(Libro).should eq(true)
            @l1.is_a?(Bibliograph).should eq(true)
            @l1.is_a?(Articulo_periodico).should eq(false)
        end    
    end    
end    

describe Articulo_periodico do
    before :each do
        @p1 = Articulo_periodico.new('Jesús Monedero', 'Idiotas o ciudadanos', '29 junio 2014', 'Diario Unidad', [21, 24])
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
        @r1 = Articulo_revista.new('Lucas Torre Champsour', 'Documentos sobre la música en la catedral de Las Palmas', 'El Museo Canario', '3 marzo 2006', [353,454])
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
        @d1 = Documento_electronico.new('Andrew Harnack', 'Beyond the MLA handbook', 'en línea', 'Chicago: The University of Chicago Press', '4 abril 1997', '<http://falcon.eku.edu/honors/ beyond-mla/>') 
    end
    
    describe "# Clase Articulo_revista" do
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