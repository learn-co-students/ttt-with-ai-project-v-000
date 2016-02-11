class Computer < Player

  attr_accessor :board, :game

  def move(board)
    random_move = rand(1..9).to_s
    if board.valid_move?(random_move)
      computer_move = random_move
    else
      move(board)
    end
  end
end