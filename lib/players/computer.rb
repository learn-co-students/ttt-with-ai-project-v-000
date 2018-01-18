module Players

	class Computer < Player

# Pending... Trying to make my initial logic work.

# WIN_BLOCK_INDEX_PRIORIES = [ [0, 1, 2], [0, 2, 1], [1, 2, 0] ]

#     def move(board)
#       @board = board
#       # returns as input an index of type string
#       win_or_block_move('X') || win_or_block_move('O') || next_regular_move
#     end

#     def win_or_block_move(token)
#       # Attack: check win possibilities. If the player has tokens present in two cells of a winning combo,
#       #         check if the third one is available.
#       # Defend: check if oponent has win possibility.
#       Game::WIN_COMBINATIONS.each do |combination|
#         WIN_BLOCK_INDEX_PRIORIES.each do |priority|
#           binding.pry
#           if @board.cells[combination[priority[0]]] == token && @board.cells[combination[priority[1]]] == token
#             third_cell = combination[priority[2]] + 1
#             if !@board.taken?(third_cell)
#               return third_cell.to_s
#             end
#           end
#         end
#       end
#       nil
#     end

#     def next_regular_move
#       # If the third cells for win or block are not availabe, move to a random availabe cell.
#       while true do
#           random_space = rand(8) + 1
#           if @board.taken?(random_space)
#             return random_space.to_s
#           end
#         end
#       end
#     end
		
		def move(board)
      sleep 1
      move = nil

      # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.
      if !board.taken?(5)
        move = "5"

      # If going second and the middle square is taken, take the upper-left corner square.
      elsif board.turn_count == 1
        move = "1"

      # If you went first (and took the middle), take a corner square with your second move.
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s

      # If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"

      # From here on, run through the WIN_COMBINATIONS array, checking whether any of the combinations have two squares filled with the same token and a third, empty square.
      else
        Game::WIN_COMBINATIONS.detect do |cmb|

          # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
          if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          # If you can't play any winning moves, play a move to block the opponent from winning.
          elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end

        # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end

      move
		end

	end

end