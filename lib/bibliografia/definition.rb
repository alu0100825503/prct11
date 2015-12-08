class Bibliograph
    include Comparable
    
    # Todas las referencias comparten los atributos autores, título y fecha
    attr_reader :autores, :titulo, :fecha
    
    def <=> (anOther)
         self.get_primer_apellido <=> anOther.get_primer_apellido
    end    
    
    def initialize(autores, titulo, fecha)
        @autores, @titulo, @fecha = autores, titulo, fecha
    end    
    def get_autores
        vector_autores = @autores
        return vector_autores
    end    
    def get_primer_apellido
        autor = autores[0].split(/\W+/)     # Tomamos el primer autor
        autor = autor[1]                    # Nos quedamos con el primer apellido del autor anterior
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
        year = fecha[-4..-1] 
        return year
    end    
end

class Libro < Bibliograph
    attr_reader :autores, :titulo, :serie, :editorial, :edicion, :fecha, :isbn
    
    def initialize (autores, titulo, serie, editorial, edicion, fecha, isbn)
       super(autores, titulo, fecha)
       @serie = serie
       @editorial = editorial
       @edicion = edicion
       @isbn = isbn
    end  
    
    def to_s
       s = ""
       i=0
       
       while i < autores.size
            nombre, apellido = autores[i].split(/\W+/)
            nombre = nombre[0] + "."
            autor = apellido + ', ' + nombre
            s += autor
            
            if !(i == autores.size-1) # si hay más autores, ponemos '&'
                s += " & "
            end    
            i += 1
       end
        
        s += ' (' + get_year + '). ' + get_titulo + ' (' + @edicion + '). ' + @editorial
    end    
end

class Articulo_revista < Bibliograph
    attr_reader :autores, :titulo, :revista, :fecha, :paginas
    
    def initialize (autores, titulo, revista, fecha, paginas)
       super(autores, titulo, fecha)
       @revista = revista
       @paginas = paginas
    end
    
    def to_s
       s = ""
       i = 0
       
        while i < autores.size
           nombre, apellido = autores[i].split(/\W+/)
           nombre = nombre[0] + "."                 
           autor = apellido + ', ' + nombre
           
           if !(i == autores.size-1) # si hay más autores, ponemos '&'
                s += " & "
            end
           
           i += 1
        end   
        
       # se debe poner en mayúsculas las palabras del título de revistas
       titulo = ""
       aux = get_titulo.split(/\W+/)
       aux.each do |element|
           titulo += element.capitalize
           titulo += ' ' 
       end
       titulo = titulo.chomp(" ") # Quitamos el último espacio
       ######
        
       n_paginas = (@paginas[1] - @paginas[0]).to_s
       s = autor + ' (' + get_year + '). ' + titulo + ". En " + @revista + ' (' + n_paginas + ' páginas).' 
    end    
end

class Articulo_periodico < Bibliograph
    attr_reader :autores, :titulo, :fecha, :periodico, :numeros_paginas
    
    def initialize (autores, titulo, fecha, periodico, numeros_paginas)
       super(autores, titulo, fecha)
       @periodico = periodico
       @numero_paginas = numeros_paginas
    end
    
    def to_s
       s = ""
       i = 0
       
       while i < autores.size 
           nombre, apellido = autores[i].split(/\W+/)
           nombre = nombre[0] + "."                 
           autor = apellido + ', ' + nombre
           i += 1
        end   
       numero_pag = @numero_paginas[0].to_s + ', ' + @numero_paginas[1].to_s
       s = autor + ' (' + get_fecha + '). ' + get_titulo + '. ' + @periodico + '. [' + numero_pag + ']'
    end    
end

class Documento_electronico < Bibliograph
    attr_reader :autores, :titulo, :tipo_medio, :editorial, :fecha, :via
    
    def initialize (autores, titulo, tipo_medio, editorial, fecha, via)
       super(autores, titulo, fecha)
       @tipo_medio = tipo_medio
       @editorial = editorial
       @fecha = fecha
       @via = via
    end
    
    def to_s
       s = ""
       i = 0
       
       while i < autores.size
           nombre, apellido = autores[i].split(/\W+/)
           nombre = nombre[0] + "."                 
           autor = apellido + ', ' + nombre
           i += 1
        end       
       s = autor + ' (' + get_year + '). ' + get_titulo + ' [' + @tipo_medio + ']. ' + "Ed: " + @editorial + ". Disponible en: " + @via
    end    
end    