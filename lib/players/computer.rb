class Player::Computer < Player
  def move(board)
    input_options = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    input_options.collect do |input|
      input if board.valid_move?(input)
    end.sample
  end
end
