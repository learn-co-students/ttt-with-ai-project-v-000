require 'pry'
module Players

  class Computer < Player

    def move(board)
      valid_moves = Board.new.cells.map.with_index(1) do |v, i|
        if v == " "
          i.to_s
        end
      end
      valid_moves.sample.to_s
    end
  end
end


    # def center_move(board)
    #   #if center is available always make this move
    #   if !@board.taken?(5)
    #     @board.update(5)
    #   end
    # end
    #
    # def corner_move(board)
    #   #else make this one of the corner moves
    #   corner_move = [1,3,7,9].sample
    #   if valid_move?(corner_move)
    #     @board.update(corner_move)
    #   end
    # end
    # def block_move(board)
    #
    # end
    # def opposite_corner(board)
    #   if @board.position(1) == token && valid_move?(9)
    #     @board.update(9,token)
    #   elsif @board.position(9) == token && valid_move?(1)
    #     @board.update(1,token)
    #   elsif @board.position(3) == token && valid_move?(7)
    #     @board.update(7,token)
    #   elsif @board.position(7) == token && valid_move?(3)
    #     @board.update(3,token)
    #   end
    # end
    # def win_move(board)
    #   center_move(board) ||
    #   if !@board.taken?(7)
    #     @board.update(7,token)
    #   elsif !@board.taken?(3)
    #     @board.update(7,token)
    #   end
    #
    #   if
    #
    #
    #   end
    # end
    # def move(board)
    #   corner_move(board)
    #   # if valid_move?(5) center_move(board)
    #
    #   win_move(board)
    # end

      # ||edge_move(board)||win_move(board)
#     end
#
# end
