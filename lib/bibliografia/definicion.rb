class Bibliograph
    attr_reader :autor, :titulo, :serie, :editorial, :edicion, :fecha, :isbn
    
    def initialize(autor, titulo, serie, editorial, edicion, fecha, isbn)
        @autor, @titulo, @serie, @editorial, @edicion, @fecha, @isbn = autor, titulo, serie, editorial, edicion, fecha, isbn 
    end    
    def get_autores
        vector_autores = @autor
        return vector_autores
    end    
    def get_titulo
        titulo = @titulo 
        return titulo
    end 
    def get_serie 
        serie = @serie
        return serie
    end
    def get_editorial
        editorial = @editorial
        return editorial
    end    
    def get_edicion
        edicion = @edicion
        return edicion
    end    
    def get_fecha
        fecha = @fecha
        return fecha
    end    
    def get_isbn
        vector_isbn = @isbn
        return vector_isbn
    end    
    def get_reference_formatted
        vector_reference =  [@autor, @titulo, @serie, @editorial, @edicion, @fecha, @isbn]
        return vector_reference
    end    
end

class Libro < Bibliograph
    def initialize (autor, titulo, serie, editorial, edicion, fecha, isbn)
       super(autor, titulo, serie, editorial, edicion, fecha, isbn) 
    end    
end

class Articulo_revista < Bibliograph

end

class Articulo_periodico < Bibliograph
    
end

class Articulo_periodico < Bibliograph
    
end    