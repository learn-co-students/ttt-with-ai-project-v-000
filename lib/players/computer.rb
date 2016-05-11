class Player::Computer < Player
  #go to the center

 def move(board) 
  if board.taken?(5) == false
    "5"
  else
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
end


