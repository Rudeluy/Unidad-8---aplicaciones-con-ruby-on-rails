require_relative 'module.rb'

class Animal
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

class Ave < Animal
end

class Insecto < Animal
end

class Mamifero < Animal
end

class Pinguino < Ave
    include Habilidades::Nadador,Habilidades::Caminante,Alimentacion::Carnivoro
end

class Paloma < Ave
    include Habilidades::Volador,Habilidades::Caminante,Alimentacion::Herbivoro
end

class Pato < Ave
    include Habilidades::Volador,Habilidades::Caminante,Habilidades::Nadador,Alimentacion::Herbivoro
end

class Perro < Mamifero
    include Habilidades::Nadador,Habilidades::Caminante,Alimentacion::Carnivoro
end

class Gato < Mamifero
    include Habilidades::Nadador,Habilidades::Caminante,Alimentacion::Carnivoro
end

class Vaca < Mamifero
    include Habilidades::Caminante,Alimentacion::Herbivoro
end

class Mosca < Insecto
    include Habilidades::Caminante,Habilidades::Volador,Alimentacion::Herbivoro,Alimentacion::Carnivoro
end

class Mariposa < Insecto
    include Habilidades::Volador,Alimentacion::Herbivoro
end

class Aveja < Insecto
    include Habilidades::Volador,Alimentacion::Herbivoro 
end

a = Pinguino.new("Penguin").caminar
puts a
b = Paloma.new("Pigeon").volar
puts b
c = Pato.new("Duck").sumergir
puts c
