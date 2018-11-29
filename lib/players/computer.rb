# module Players 
#   class Computer < Player 
    
#     def move(board)
#       valid_moves = Array.new
#       board.cells.each_with_index do |position, index|
#         if position == " "
#           valid_moves << (index+1).to_s
#         end
#       end
#       valid_moves.sample
#     end  
#   end 
# end

module Players 
  class Computer < Player 
    
    def move(board)
      valid_moves = Array.new
      board.cells.each_with_index do |position, index|
        if position == " "
          valid_moves << index
        end
      end
      binding.pry
      test_board = board  
      valid_moves.each do |valid_move|
        test_board.update(valid_move+1, self)
        if test_board.won?
          return (valid_move+1).to_s
        end 
      end 
        
      # WIN_COMBINATIONS.find do |combo|
      #   if @board.cells[combo[0]] == @board.cells[combo[1]] || @board.cells[combo[1]] == @board.cells[combo[2]] || @board.cells[combo[2]] == @board.cells[combo[0]] && !(@board.cells[combo[1]] == " ")
      # valid_moves.map do |valid_move|
      # if WIN_COMBINATIONS.any?{ |combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] }
      valid_moves.map{ |valid| valid.to_i-1 }
    end  
    
    
    
  end 
end


# AI strategy: 
# Win: If you have two in a row, play the third to get three in a row.
# Block: If the opponent has two in a row, play the third to block them.
# Center: Play the center.
# Opposite Corner: If the opponent is in the corner, play the opposite corner.
# Empty Corner: Play an empty corner.
# Empty Side: Play an empty side.