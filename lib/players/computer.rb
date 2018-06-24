require 'pry'
class Player::Computer < Player
  #go to the center
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]

 def move(board)
   valid_move = board.cells.each_index.select { |index| board.cells[index] == " "}
    if valid_move.include?(4)
    "5"
    else 
     random || complete_combo(board)
    end
    #complete_combo(board)
#try to get 3 in a row or block opponent from getting 3 in a row
#just needs to check if the win combo
#has two of the same token. if 2 of self, go there. if 2 of opponent, block it

  end


 def has_two_tokens(board)
    WIN_COMBINATIONS.detect do |combo|
      (board.cells[combo[0]] == board.cells[combo[1]] && !board.taken?(combo[2]+1)) ||
      (board.cells[combo[1]] == board.cells[combo[2]] && !board.taken?(combo[0]+1)) ||
      (board.cells[combo[2]] == board.cells[combo[0]] && !board.taken?(combo[1]+1))
  end
end

def complete_combo(board)
  if !has_two_tokens(board).nil?
    has_two_tokens(board).find { |index| board.cells[index] == " "}+1
  end
end

def random
  (1..9).to_a.sample
end

end


