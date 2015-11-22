require "spec_helper"
require "./lib/bibliografia/definicion.rb"

describe Bibliograph do
  before :each do
    @b1 = Bibliograph.new(['Dave Thomas', 'Andy Hunt'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'The Facets of Ruby', 'Pragmatic Bookshelf', '4 edition', 'July 7, 2013', [978-1937785499, 1937785491])
    @l1 = Libro.new('Scott Chacon', 'Pro Git 2009th Edition', 'Pro', 'Apress', '2009 edition', 'August 27, 2009', ['978-1430218333', '1430218339'])
    @p1 = Articulo_periodico.new(['David Flanagan', 'Yukihiro Matsumoto'], 'The Ruby Programming Language', nil, 'O’Reilly Media', '1 edition', 'February 4, 2008', ['0596516177', '978-0596516178'])
    @r1 = Articulo_revista.new(['David Flanagan', 'Yukihiro Matsumoto'], 'The Ruby Programming Language', nil, 'O’Reilly Media', '1 edition', 'February 4, 2008', ['0596516177', '978-0596516178'])
    @d1 = Documento_electronico.new(['David Flanagan', 'Yukihiro Matsumoto'], 'The Ruby Programming Language', nil, 'O’Reilly Media', '1 edition', 'February 4, 2008', ['0596516177', '978-0596516178']) 
  end    
    
  describe "# Almacenamiento del autor, título, etc" do
    it "Se almacena correctamente el primer autor" do
        @b1.autor[0].should eq('Dave Thomas') 
    end
    it "Se almacena correctamente el título" do
        @b1.titulo.should eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide') 
    end    
    it "Se almacena correctamente la serie" do
        @b1.serie.should eq('The Facets of Ruby')
    end
    it "Se almacena correctamente la editorial" do
        @b1.editorial.should eq('Pragmatic Bookshelf')
    end
    it "Se almacena correctamente la edición" do
        @b1.edicion.should eq('4 edition')
    end
    it "Se almacena correctamente la fecha" do
        @b1.fecha.should eq('July 7, 2013')
    end
    it "Se almacena correctamente el primer isbn" do
        @b1.isbn[0].should eq(978-1937785499)
    end    
    it "Listado de autores" do
        @b1.get_autores.should eq(['Dave Thomas', 'Andy Hunt']) 
    end    
    it "Obtener título" do
       @b1.get_titulo.should eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide') 
    end 
    it "Obtener serie" do
       @b1.get_serie.should eq('The Facets of Ruby') 
    end    
    it "Obtener editorial" do
       @b1.get_editorial.should eq('Pragmatic Bookshelf') 
    end    
    it "Obtener el número de edición" do
       @b1.get_edicion.should eq('4 edition') 
    end    
    it "Obtener la fecha" do
       @b1.get_fecha.should eq('July 7, 2013') 
    end
    it "Listado de ISBN" do
       @b1.get_isbn.should eq([978-1937785499, 1937785491]) 
    end
    it "Bibliografía formateada" do
       @b1.get_reference_formatted.should eq(
           [['Dave Thomas', 'Andy Hunt'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 
           'The Facets of Ruby', 'Pragmatic Bookshelf', '4 edition', 'July 7, 2013', [978-1937785499, 1937785491]])  
    end    
    it "Comparar bibliografías" do
       expect(@b1 > @l1).to eq(true)
       expect(@b1 < @p1).to eq(false)
       expect(@p1 == @r1).to eq(true)
       expect(@d1 > @l1).to eq(false)
    end    
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
        @p1 = Articulo_periodico.new(['David Flanagan', 'Yukihiro Matsumoto'], 'The Ruby Programming Language', nil, 'O’Reilly Media', '1 edition', 'February 4, 2008', ['0596516177', '978-0596516178'])
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
        @r1 = Articulo_revista.new(['David Flanagan', 'Yukihiro Matsumoto'], 'The Ruby Programming Language', nil, 'O’Reilly Media', '1 edition', 'February 4, 2008', ['0596516177', '978-0596516178'])
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
        @d1 = Documento_electronico.new(['David Flanagan', 'Yukihiro Matsumoto'], 'The Ruby Programming Language', nil, 'O’Reilly Media', '1 edition', 'February 4, 2008', ['0596516177', '978-0596516178'])
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