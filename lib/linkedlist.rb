#require "./lib/bibliografia/definicion.rb"

Nodo = Struct.new(:value, :next, :prev)

class Linkedlist
    include Enumerable
    attr_reader :begin, :end, :size
    
    def initialize
        @begin = Nodo.new(nil, nil, nil)
        @end = Nodo.new(nil, nil, nil)
        @size = 0
    end
    
    def each
        nodo_aux = @begin
        while nodo_aux != nil
            yield nodo_aux
            nodo_aux = nodo_aux.next
        end
    end    
    
    def insert_end (value)
        nodo_aux = Nodo.new(value, nil, nil)
        
        if size==0  
            @begin = nodo_aux
            @end = nodo_aux
        
        else
            nodo_aux.prev = @end
            @end.next = nodo_aux
            @end = nodo_aux
        end
        
        @size = @size + 1
    end  
    
    def empty?
        @begin == nil
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
    
    def get_next_firstnode
        return @begin.next 
    end    
    
    def get_prev_lastnode
        return @end.prev.value
    end    
    
    def get_begin
        return @begin.value 
    end    
    
    def get_end
        return @end.value
    end    
    
    def get_element_by_pos pos # 0 <= pos < size
        
        nodo_aux = @begin
        i = 0
        
        while (i < pos)
           nodo_aux = nodo_aux.next 
           i = i + 1
        end    
        
        return nodo_aux.value
    end
    
    def to_s
        
        nodo_aux = @begin
        while (nodo_aux != nil)
            puts nodo_aux
            nodo_aux = nodo_aux.next
        end
    end    
end