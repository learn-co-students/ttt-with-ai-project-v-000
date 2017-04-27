module Players
  class Human < Player
    def move (array)
      puts "Please enter your move:"
      user_input=gets.chomp
    end
  end

end
