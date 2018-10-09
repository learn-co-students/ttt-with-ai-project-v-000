module Players

  class Computer < Player

    def move(board)
      @board = board
      puts "Which cell would you like to pick (1-9)?"
      move_to_make
    end

    def move_to_make

      

      @board.taken?(index) == true



      end

    end


  end



end
