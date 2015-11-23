require "./lib/linkedlist.rb"
require "./lib/bibliografia/definicion.rb"

describe Linkedlist do 
    before :each do
        @l1 = Bibliograph.new(['Dave Thomas', 'Andy Hunt'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'The Facets of Ruby', 'Pragmatic Bookshelf', '4 edition', 'July 7, 2013', ['978-1937785499', '1937785491'])
        @l2 = Bibliograph.new('Scott Chacon', 'Pro Git 2009th Edition', 'Pro', 'Apress', '2009 edition', 'August 27, 2009', ['978-1430218333', '1430218339'])
        @l3 = Bibliograph.new(['David Flanagan', 'Yukihiro Matsumoto'], 'The Ruby Programming Language', nil, 'O’Reilly Media', '1 edition', 'February 4, 2008', ['0596516177', '978-0596516178'])
        @l4 = Bibliograph.new(['David Chelimsky', 'Dave Astels', 'Bryan Helmkamp', 'Dan North', 'Zach Dennis', 'Aslak Hellesoy'], 'The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends', 'The Facets of Ruby', 'Pragmatic Bookshelf', '1 edition', 'December 25, 2010', ['1934356379', '978-1934356371'])
        @l5 = Bibliograph.new('Richard E. Silverman', 'Git Pocket Guide', nil, 'O’Reilly Media', '1 edition', 'August 2, 2013', ['1449325866', '978-1449325862'])
    
        @list = Linkedlist.new()
    end

    describe "Nodo" do
        it "El nodo contiene correctamente su información" do
            @list.insert_end(:l1)
            @list.get_end.should eq(:l1)
        end    
    end   
    
    describe "Lista enlazada" do
        it "Se inserta correctamente un elemento" do
           @list.insert_end(:l1) 
           @list.get_end.should eq(:l1)
        end    
        it "Se extrae el primer elemento de la lista" do
            @list.insert_end(:l1)
            @list.extract_begin
            @list.size.should eq(0)
        end
        it "Se pueden insertar varios elementos en la lista" do
            @list.insert_end(:l1) 
            @list.insert_end(:l2)
            @list.insert_end(:l3)
            @list.insert_end(:l4)
            @list.insert_end(:l5)

            # Si las inserciones se han realizado con éxito, 
            # el último elemento de la lista será el último que se ha insertado
            @list.get_end.should eq(:l5)
        end    
        it "La lista debe tener una cabeza" do
            @list.insert_end(:l3)
            @list.get_begin.should_not be(nil) 
        end    
        it "Se puede obtener el nodo previo al último" do
            @list.insert_end(:l3)
            @list.insert_end(:l4)
            @list.get_prev_lastnode.should eq(:l3)
        end    
        it "Se puede obtener el valor de un nodo dada su posición en la lista" do
            @list.insert_end(:l1)
            @list.insert_end(:l2)
            @list.insert_end(:l3)
            @list.get_element_by_pos(2).should eq(:l3)
        end  
        context "# Haciendo la clase LinkedList enumerable" do
            before :each do
                @list1 = Linkedlist.new()
                @list1.insert_end(1)
                @list1.insert_end(2)
                @list2 = Linkedlist.new()
                @list2.insert_end(nil)
            end
            
            # any? returns true if at least 
            # one of the collection members 
            # is not false or nil 
            it "Comprobando el método any?" do
                expect(@list1.any?).to eq true 
                expect(@list2.any?).to eq false
            end
               
            # all? returns true when none 
            # of the collection members 
            # are false or nil    
            it "Comprobando el método all?" do
                expect(@list1.all?).to eq true
            end    
                
            # count returns the number of
            # items in enum through enumeration
            #expect(@list1.count).to eq(3) 
            
            
            #expect(@list1.all?).to eq(true)
            
            
            # Drops first n elements from enum, 
            # and returns rest elements in an array
            # In this case, we drop @begin and @end,
            # and return an array containing @size
            #expect(@list1.drop(2)).to eq([2])
            
            # detect returns the first for which block is 
            # not false. NOTE: detect and find are 
            # two names for the same method.
            #expect(@list1.detect {|i| i == 2}).to eq(2)
        end    
    end    

end        