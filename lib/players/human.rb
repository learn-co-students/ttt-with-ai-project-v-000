module Players

  class Human < Player

    def move (board = nil)
      puts "Please enter your position 1-9"
      gets.chomp
    end


  end



end
