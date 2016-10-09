class Computer < Player

  #[0, 1, 2]
  #[3, 4, 5]
  #[6, 7, 8]

  #[1, 2, 3]
  #[4, 5, 6]
  #[7, 8, 9]

  def move(board)
    corners = [1, 3, 7, 9]

    if board.cells[4] == " "
      "2"  
    elsif board.cells[0] == " " || board.cells[2] == " " || board.cells[6] = " " || board.cells[8] = " "
      corners.sample.to_s
    else
      rand(1..9).to_s
    end
  end


end