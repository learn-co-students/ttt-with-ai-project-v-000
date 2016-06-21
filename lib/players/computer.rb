class Computer < Player

  def move(board)
    input = rand(1..9).to_s

    if board.valid_move?(input)
      board.update(input, self)
      board.display
      input
    else
      input
    end
  end

end # => Computer Class