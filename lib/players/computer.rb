require 'pry'
module Players

  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


      def move(board)
        @board = board
        # corner_moves = [1,3,7,9]
        # if corner_moves.collect {|move| @board.valid_move?(move)}
        #   corner_moves.sample
        # else
        win_move = WIN_COMBINATIONS.collect do |win|
          win.each{|w| @board.valid_move?(w)}

        end.sample
        win_move.sample.to_s
      # end

      end

  end
end
