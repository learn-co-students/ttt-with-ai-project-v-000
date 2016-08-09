module Players
  class Computer < Player
    attr_accessor :choice


    def move(game)
      sleep(1)
      find_move(game)
      @choice
    end

    def score(game)
      if game.winner == "X"
        return 10
      elsif game.winner == "O"
        return -10
      elsif game.winner == nil
        return 0
      end
    end

    def find_move(game)
      moves = game.get_available_moves

      @choice = nil

      moves.each do |move|
          if @token == "X"
            game.board.cells[move - 1] = "X"
            if game.winner == "X"
              @choice = move
              game.board.cells[move - 1] = " "
            else
              game.board.cells[move - 1] = " "
            end

          elsif @token == "O"
            game.board.cells[move - 1] = "O"
            if game.winner == "O"
              @choice = move
              game.board.cells[move - 1] = " "
            else
              game.board.cells[move - 1] = " "
            end

          end
        end

      

      if @choice == nil
        moves.each do |move|

        if @token == "X"
          game.board.cells[move - 1] = "O"
          if game.winner == "O"
            @choice = move
            game.board.cells[move - 1] = " "
          else
            game.board.cells[move - 1] = " "
          end

        elsif @token == "O"
          game.board.cells[move - 1] = "X"
          if game.winner == "X"
            @choice = move
            game.board.cells[move - 1] = " "
          else
            game.board.cells[move - 1] = " "
          end
        end
      end

      end

      if @choice == nil
        @choice = moves.sample
      end
    end

  end

end