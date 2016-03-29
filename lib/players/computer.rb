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
    valid = []
    positions.each do |num|
      valid << num.to_s if board.valid_move?(num.to_s)
    end
    # valid.sample
    ai(board, valid)
  end

  def ai(board, array)
    if board.all_empty?
      first_move
    else
      # array.sample
      attack(board, array)
    end
  end

  def first_move
    position = ["1", "3", "5", "7", "9"]
    position.sample
  end

  def attack(board, array)
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == self.token &&
         board.cells[combo[1]] == self.token &&
         board.cells[combo[2]] == " "
           board.cells[combo[2]] = self.token

      elsif board.cells[combo[0]] == self.token &&
            board.cells[combo[2]] == self.token &&
            board.cells[combo[1]] == " "
              board.cells[combo[1]] = self.token

      elsif board.cells[combo[1]] == self.token &&
            board.cells[combo[2]] == self.token &&
            board.cells[combo[0]] == " "
              board.cells[combo[0]] = self.token
      else
        array.sample
      end
    end
  end

end