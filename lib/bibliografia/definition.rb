# Clase que representa referencias bibliográficas en formato APA

class Bibliograph
    include Comparable
    
    # Todas las referencias comparten los atributos autores, título y fecha
    attr_accessor :titulo, :autores, :fecha
    
    def <=> (anOther)
        
        # Si los autores son iguales, se compara por el año
        if self.get_primer_apellido != anOther.get_primer_apellido
            self.get_primer_apellido <=> anOther.get_primer_apellido
                
        else
            self.get_year <=> anOther.get_year
        end    
    end    
    
    def initialize(titulo, &bloque)
        self.titulo = titulo
        instance_eval &bloque if block_given?
    end    
    
    def autor(name)
        @autores = []
        @autores << name # Se añade autor al vector de autores
    end    
    
    def fecha(date)
        @fecha = date 
    end    
    
    def get_autores
       s = ""
       i=0
       
       while i < @autores.size
            nombre, apellido = @autores[i].split(/\W+/)
            nombre = nombre[0] + "."
            autor = apellido + ', ' + nombre
            s += autor
            
            if !(i == @autores.size-1) # si hay más autores, ponemos '&'
                s += " & "
            end    
            i += 1
       end
       
       return s
    end    
    def get_primer_apellido
        autor = @autores[0].split(/\W+/)     # Tomamos el primer autor
        autor = @autores[1]                    # Nos quedamos con el primer apellido del autor anterior
    end    
    def get_titulo
        titulo = @titulo 
        return titulo
    end 
    def get_fecha
        fecha = @fecha
        return fecha
    end   
    def get_year
        year = @fecha[-4..-1] 
        return year
    end    
end


# CLASE LIBRO

class Libro < Bibliograph
    attr_accessor :serie, :editorial, :edicion, :isbn
    
    def initialize (titulo, &bloque)
       super(titulo)
       instance_eval &bloque if block_given?
    end  
    
    def serie(name)
        @serie = name
    end    
    
    def editorial(name)
        @editorial = name
    end    
    
    def edicion(number_of_edition)
        @edicion = number_of_edition 
    end    
    
    def isbn(number_of_isbn)
        @isbn = number_of_isbn 
    end    
    
    def to_s
       s = get_autores
       s += ' (' + get_year + '). ' + get_titulo + ' (' + @edicion + '). ' + @editorial
    end    
end


# CLASE ARTÍCULO DE REVISTA

class Articulo_revista < Bibliograph
    attr_accessor :revista, :paginas
    
    def initialize (titulo, &bloque)
        super(titulo)
        instance_eval &bloque if block_given?
    end
    
    def revista(name)
        @revista = name
    end    
    
    def paginas(number_of_pages)
        @paginas = number_of_pages 
    end    
    
    def to_s
       s = get_autores
        
       # se debe poner en mayúsculas las palabras del título de revistas
       titulo = ""
       aux = get_titulo.split(/\W+/)
       
       aux.each do |element|
           titulo += element.capitalize
           titulo += ' ' 
       end
       
       titulo = titulo.chomp(" ") # Quitamos el último espacio
       s += ' (' + get_year + '). ' + titulo + ". En " + @revista + ' (' + @paginas + ' páginas).' 
    end    
end

class Articulo_periodico < Bibliograph
    attr_reader :periodico, :numeros_paginas
    
    def initialize (titulo, &bloque)
        super(titulo)
        instance_eval &bloque if block_given?
    end
    
    def periodico(name)
        @periodico = name
    end
    
    def numeros_paginas(numbers)
        @numeros_paginas = numbers 
    end    
    
    def to_s
       s = get_autores  
       s += ' (' + get_fecha + '). ' + get_titulo + '. ' + @periodico + '. [' + @numeros_paginas + ']'
    end    
end

class Documento_electronico < Bibliograph
    attr_reader :tipo_medio, :editorial, :via
    
    def initialize (titulo, &bloque)
        super(titulo)
        instance_eval &bloque if block_given?
    end
    
    def tipo_medio(name)
        @tipo_medio = name 
    end    
    
    def editorial(name)
        @editorial = name 
    end    
    
    def via(name)
        @via = name 
    end    
    
    def to_s
       s = get_autores   
       s += ' (' + get_year + '). ' + get_titulo + ' [' + @tipo_medio + ']. ' + "Ed: " + @editorial + ". Disponible en: " + @via
    end    
end