require 'pry'

module Players
  class Computer < Player
    attr_reader :best_choice

      #def initialize(piece, ui)
      #  super(piece, ui)
      #  @opponent = switch(piece)
      #end

      def move(board)
                        #current_player
        pos_num = minmax(board, self.token)
        board.update(pos_num, self)
        #board.place_piece(best_choice, self.token)
      end

      def minmax(board, current_player_token)
      #  if game_over?(board)
      #    score(board)
      #  end

        scores = {}

        board.available_spaces.each do |cell|
          potential_board = board.dup
          potential_board.update(cell, current_player_token)

          scores[cell] = self.minmax(potential_board, self.switch(current_player_token))
        end

        @best_choice, best_score = self.best_move(current_player_token, scores)
        best_score
      end

      def best_move(token, scores)
        if token == self.token
          scores.max_by { |_k, v| v }
        else
          scores.min_by { |_k, v| v }
        end
      end

      def score(board)
        if board.winner == self.token
          10
        elsif board.winner == self.switch(self.token)
          -10
        end
        0
      end

      def switch(current_player_token)
        current_player_token == 'X' ? 'O' : 'X'
      end

  end
end


    #def move(board)
    #  valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    #  if board.valid_move?(valid_moves.sample)
    #    pos_num = valid_moves.sample
    #  end
    #  until board.valid_move?(valid_moves.sample) == true
    #    pos_num = valid_moves.sample
    # end
    #  pos_num
    #end

  #end
#end
