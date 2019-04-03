module Players
  class Human < Player

    def move(input)
      puts "Please enter your selection"
      input = gets.strip
      input
    end
  


  end 
end