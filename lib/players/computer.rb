require 'pry'

module Players
  class Computer < Player

    attr_reader :best_choice


      def move(board)
        pos_num = minmax(board, self)
        pos_num
      end

      def minmax(board, current_player)
        if board.over? == true
          return scores(board)
        end

        scores = {}     #{ :position_number => }

        board.available_spaces.each do |pos_num|
          potential_board = board.dup
          potential_board.update(pos_num, current_player)

          scores[pos_num] = self.minmax(potential_board, self.switch(current_player))
        end

        best_score = self.best_move(current_player, scores)
        best_score
      end

      def best_move(current_player, scores)
        if current_player.class == String
          if current_player == self.token
            scores.max_by { |_k, v| v }
          else
            scores.min_by { |_k, v| v }
          end
        else
          if
            current_player.token == self.token
            scores.max_by { |_k, v| v }
          else
            scores.min_by { |_k, v| v }
          end
        end
      end

      def score(board)
        if board.winner == piece
          return 10
        elsif board.winner == @opponent
          return -10
        end
        0
      end

      def switch(current_player)
        if current_player.class == String
          current_player == 'X' ? 'O' : 'X'
        else
          current_player.token == 'X' ? 'O' : 'X'
        end
      end


  end
end
