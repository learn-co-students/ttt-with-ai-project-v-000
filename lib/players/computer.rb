class Computer < Player

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #top left to bottom right
    [6,4,2]  #bottom left to top right
  ]

  def move(board)
    positions = (1..9).to_a
    valid_moves = []
    positions.each do |num|
      valid_moves << num.to_s if board.valid_move?(num.to_s)
    end
    ai(board, valid_moves)
  end

  def ai(board, array)
    if board.all_empty?
      first_move
    elsif board.valid_move?("5")
      return ("5")
    else
      array.sample
      # attack(board, array)
    end
  end

  def first_move
    position = ["1", "3", "5", "7", "9"]
    position.sample
  end

end