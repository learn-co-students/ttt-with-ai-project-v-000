class Players
  class Human < Player
   def move(input)
     input = gets.chomp
     @input = input
    end
  end  
end

