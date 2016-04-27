class Player::Computer < Player
  
  def move(board)
    ## CELL REFERENCES ##
    center_cell = board.cells[4]
    center_move = 5
    corner_cells = [board.cells[0], board.cells[2], board.cells[6], board.cells[8]]
    corner_moves = [1, 3, 7, 9]

    ## AI CONDITIONALS ##
    if center_cell == " "
      center_move
    elsif corner_cells[0] == " " || corner_cells[1] == " " || corner_cells[2] == " " || corner_cells[3] == " "
      corner_moves.sample
    else
      rand(1..9)
    end
  end
  
end