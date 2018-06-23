class Computer < Player


def move(board)
    
comp_move = board.cells.find_index do |space|
  space == " "
  end 
  return (comp_move + 1).to_s
end    



end