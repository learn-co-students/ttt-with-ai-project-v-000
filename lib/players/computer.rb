class Players::Computer < Player

  def move(board)
    moves = [ ]
    if board.cells == Array.new(9, " ")
      return first_move
    else
      return input = rand(1..9).to_s
    end



  end
  def first_move
    input = ["1", "3", "5", "7", "9"].sample
  end

end
