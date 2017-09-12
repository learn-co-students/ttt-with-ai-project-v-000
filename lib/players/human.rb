module Players

  class Human < Player
    def move(token)
      puts "Input a number"
      input = gets.chomp
    end
  end

end