module Players

  class Computer < Player

    def move(board)
      @board = board
      decision = move_to_make
      puts "The computer has chosen to occupy cell #{decision}"
      puts "Please examine the updated board below:"
      decision
    end

    def move_to_make

      if @board.turn_count == 0
        decision = 5
      else
        decision = Random.new.rand(10)
        while @board.valid_move?(decision) == false
          decision = Random.new.rand(10)
        end
        decision
      end
      decision.to_s
    end


  end

end
