module Players
  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def move(board)
      #binding.pry
      first_move = 5 # Center Position
      @move = nil
      if board.valid_move?(first_move)
        @move = first_move
      elsif next_best(board)
        block_opponent(board)
        win_game(board)
        @move = next_best(board)
      elsif more_moves(board)
        block_opponent(board)
        win_game(board)
        @move = more_moves(board)
      end
        #block_opponent(board)
        #win_game(board)
        @move.to_s
    end

    def next_best(board)
      next_best_moves = [1, 3, 7, 9] #All corner positions
      spots = next_best_moves.select do |index|
                board.valid_move?(index)
              end
      spot = spots.shuffle.sample
    end

    def more_moves(board)
      more_moves = [2, 4, 6, 8]
      spots = more_moves.select do |index|
                board.valid_move?(index)
              end
      spot = spots.shuffle.sample
    end

    def win_game(board)
      WIN_COMBINATIONS.each do |array|
        if board.cells[array[0]] == board.cells[array[1]] && board.cells[array[2]] == " " && board.cells[array[0]] == token
          @move = board.cells[array[2]]
        elsif board.cells[array[1]] == board.cells[array[2]] && board.cells[array[0]] == " " && board.cells[array[1]] == token
          @move = board.cells[array[0]]
        elsif board.cells[array[2]] == board.cells[array[0]] && board.cells[array[1]] == " " && board.cells[array[2]] == token
          @move = board.cells[array[1]]
        end
      end
        @move
      end

      def block_opponent(board)
        WIN_COMBINATIONS.each do |array|
          if board.cells[array[0]] == board.cells[array[1]] && board.cells[array[2]] == " " && board.cells[array[0]] != " "
            @move = board.cells[array[2]]
          elsif board.cells[array[1]] == board.cells[array[2]] && board.cells[array[0]] == " " && board.cells[array[1]] != " "
            @move = board.cells[array[0]]
          elsif board.cells[array[2]] == board.cells[array[0]] && board.cells[array[1]] == " " && board.cells[array[2]] != " "
            @move = board.cells[array[1]]
          end
        end
         @move
        end

  end
end
