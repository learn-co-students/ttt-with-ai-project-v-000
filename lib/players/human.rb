module Players

  class Human < Player

    def move(board)
      puts "Please enter your move, 1-9"
      return gets
    end

  end

end
