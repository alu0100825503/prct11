
Nodo = Struct.new(:value, :next)

class Linkedlist
    attr_reader :begin, :end, :size
    
    def initialize()
        @begin = Nodo.new(nil, nil)
        @end = Nodo.new(nil, nil)
        @size = 0
    end
    
    def insert_end(n)
        
        if size==0  
            @begin = n
        end
        @end = n
        @size = @size + 1
    end    
    
    def extract_begin
        
        nodo_aux = Nodo.new(nil, nil)
        if size > 0
            nodo_aux = @begin
            @begin = nodo_aux.next 
            @size = @size - 1
            return nodo_aux
        end    
    end    
    
    def get_begin
        return @begin 
    end    
    
    def get_end
        return @end
    end    
    
end