/Ejercicio 1/

class Person
    attr_reader :first_name, :last_name, :age
    def initialize(first, last, age)
        @first_name = first
        @last_name = last
        @age = age
    end
    def birthday
        @age += 1
    end
end

class Student < Person
    def talk
        puts "Aquí es la clase de programación con Ruby?"
    end
    def introduce
        puts "Hola profesor. Mi nombre es #{self.first_name} #{self.last_name}."
    end
end

class Teacher < Person
    def talk
        puts "Bienvenidos a la clase de programación con Ruby!"
    end
    def introduce
        puts "Hola alumnos. Mi nombre es #{self.first_name} #{self.last_name}."
    end
end

class Parent < Person
    def talk
        puts "Aquí es la reunión de apoderados?"
    end
    def introduce
        puts "Hola. Soy uno de los apoderados. Mi nombre es #{self.first_name} #{self.last_name}."
    end
end

Student.new("Pedro", "Rodríguez", 25).introduce
Student.new("Pedro", "Rodríguez", 25).talk

Teacher.new("Rodrigo", "Albornoz", 45).introduce
Teacher.new("Rodrigo", "Albornoz", 45).talk

Parent.new("Jorge", "Soto", 40).introduce
Parent.new("Jorge", "Soto", 40).talk

/Ejercicio 2/

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