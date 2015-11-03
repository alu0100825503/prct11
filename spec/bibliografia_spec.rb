require "spec_helper"
require "./lib/bibliografia/definicion.rb"

describe Bibliograph do
  before :each do
    @l1 = Bibliograph.new(['Dave Thomas', 'Andy Hunt'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'The Facets of Ruby', 'Pragmatic Bookshelf', '4 edition', 'July 7, 2013', [978-1937785499, 1937785491])
  end    
    
  describe "# Almacenamiento del autor, título, etc" do
    it "Se almacena correctamente el primer autor" do
        @l1.autor[0].should eq('Dave Thomas') 
    end
    it "Se almacena correctamente el título" do
        @l1.titulo.should eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide') 
    end    
    it "Se almacena correctamente la serie" do
        @l1.serie.should eq('The Facets of Ruby')
    end
    it "Se almacena correctamente la editorial" do
        @l1.editorial.should eq('Pragmatic Bookshelf')
    end
    it "Se almacena correctamente la edición" do
        @l1.edicion.should eq('4 edition')
    end
    it "Se almacena correctamente la fecha" do
        @l1.fecha.should eq('July 7, 2013')
    end
    it "Se almacena correctamente el primer isbn" do
        @l1.isbn[0].should eq(978-1937785499)
    end    
    it "Listado de autores" do
        @l1.get_autores.should eq(['Dave Thomas', 'Andy Hunt']) 
    end    
    it "Obtener título" do
       @l1.get_titulo.should eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide') 
    end 
    it "Obtener serie" do
       @l1.get_serie.should eq('The Facets of Ruby') 
    end    
    it "Obtener editorial" do
       @l1.get_editorial.should eq('Pragmatic Bookshelf') 
    end    
    it "Obtener el número de edición" do
       @l1.get_edicion.should eq('4 edition') 
    end    
    it "Obtener la fecha" do
       @l1.get_fecha.should eq('July 7, 2013') 
    end
    it "Listado de ISBN" do
       @l1.get_isbn.should eq([978-1937785499, 1937785491]) 
    end
    it "Bibliografía formateada" do
       @l1.get_reference_formatted.should eq(
           [['Dave Thomas', 'Andy Hunt'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 
           'The Facets of Ruby', 'Pragmatic Bookshelf', '4 edition', 'July 7, 2013', [978-1937785499, 1937785491]])  
    end    
  end
end