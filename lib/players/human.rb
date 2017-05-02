require 'pry'
module Players
  class Human < Player


    def move(something) #whats the arg here?
       puts "Please enter a number between 1 - 9"
       #@somthing = something << ???
       @input = gets
       @input
    end

  end
end
