class Player::Computer < Player
  #go to the center

 def move(board) 
  if board.taken?(4) == false
    "5"
  elsif board.taken?(0) == false
    "1"
  elsif board.taken?(2) == false
    "3"
  elsif board.taken?(6) == false
    "7"
  elsif board.taken?(8) == false
    "9"
  else
    complete_combo(board)
#try to get 3 in a row or block opponent from getting 3 in a row
#just needs to check if the win combo
#has two of the same token. if 2 of self, go there. if 2 of opponent, block it
  end
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
    has_two_tokens(board).detect { |index| board.cells[index] == " "}+1
  end
end

end


