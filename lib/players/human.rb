module Players


  class Human < Player

    def move(board)
      puts "Where would you like to go? Please enter number 1-9"
      gets.chomp
    end

  end



end
