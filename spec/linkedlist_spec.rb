require "./lib/linkedlist.rb"
require "./lib/bibliografia/definicion.rb"

describe Linkedlist do 
    before :each do
        @l1 = Bibliograph.new(['Dave Thomas', 'Andy Hunt'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'The Facets of Ruby', 'Pragmatic Bookshelf', '4 edition', 'July 7, 2013', ['978-1937785499', '1937785491'])
        @l2 = Bibliograph.new('Scott Chacon', 'Pro Git 2009th Edition', 'Pro', 'Apress', '2009 edition', 'August 27, 2009', ['978-1430218333', '1430218339'])
        @l3 = Bibliograph.new(['David Flanagan', 'Yukihiro Matsumoto'], 'The Ruby Programming Language', nil, 'O’Reilly Media', '1 edition', 'February 4, 2008', ['0596516177', '978-0596516178'])
        @l4 = Bibliograph.new(['David Chelimsky', 'Dave Astels', 'Bryan Helmkamp', 'Dan North', 'Zach Dennis', 'Aslak Hellesoy'], 'The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends', 'The Facets of Ruby', 'Pragmatic Bookshelf', '1 edition', 'December 25, 2010', ['1934356379', '978-1934356371'])
        @l5 = Bibliograph.new('Richard E. Silverman', 'Git Pocket Guide', nil, 'O’Reilly Media', '1 edition', 'August 2, 2013', ['1449325866', '978-1449325862'])
        
        @n1 = Nodo.new(:l1, :l2)
        @n2 = Nodo.new(:l2, :l3)
        @n3 = Nodo.new(:l3, :l4)
        @n4 = Nodo.new(:l4, :l5)
        @n5 = Nodo.new(:l5, nil)
        
        @list = Linkedlist.new
    end

    describe "Nodo" do
        it "El nodo contiene correctamente su información" do
            @n1.value.should eq(:l1)
            @n1.next.should eq(:l2) 
        end    
    end   
    
    describe "Lista enlazada" do
        it "Se inserta correctamente un elemento" do
           @list.insert_end(:n1) 
           @list.get_end.should eq(:n1)
        end    
        it "Se extrae el primer elemento de la lista" do
            @list.insert_end(:n1)
            @list.extract_begin
            @list.size.should eq(0)
        end    
    end    

end        