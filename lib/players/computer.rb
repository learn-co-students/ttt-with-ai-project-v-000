module Players

  class Computer < Player
    attr_accessor :board, :current_player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", " 8", "9"]
      comp_move = valid_moves.sample
    end

    def get_score
      return  1 if @board.won?("x")
      return -1 if @board.won?("o")
      return  0 if @board.draw?
    end

    def unmove
      @board[movelist.pop] = "-"
      @turn = other_turn
      self
    end

    def possible_moves
      @board.map.with_index { |token, index| token == "-" ? index : nil }.compact
    end

    def minimax_for(valid_moves)
      @board.move(valid_moves)

      score = get_score

      (@board.unmove ; score) if score

      scores = []

      possible_moves.each do |move_index|
        scores << minimax_for(move_index)
        end

        # if @board.turn == "x"
        if @board.turn
          unmove
            scores.max
          else
            unmove
            scores.min
        end
      end
      end

      def decide_move
        0 if @board.empty?

        minimax_values = {}

        @board.possible_moves.each do |move_index|
          minimax_values[move_index] = minimax_for(move_index)
        end

        best_move = minimax_values.each{ |key, value| key if value == minimax_values.values.max }

        best_move
      end
    end


#test
#load "config/environment.rb"
