module Players

  class Computer < Player

    def move(board)
      @board = board
      puts "Which cell would you like to pick (1-9)?"
      move_to_make
    end

    def move_to_make
      decision = Random.new.rand(9)
      while @board.valid_move?(decision) == false
        decision = Random.new.rand(9)
      end
      decision.to_s
    end


  end

end
