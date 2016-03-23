class Computer < Player
 
  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #first column
    [1, 4, 7], #second column
    [2, 5, 8], #third column
    [0, 4, 8], #first diagonal
    [2, 4, 6], #second diagonal
  ]

  attr_accessor :mode
  @mode = "hard"

  def easy_mode
    @mode = "easy"
  end
  def hard_mode
    @mode = "hard"
  end 

  def defense_needed(board)
    #returns the best move if the opponent is one away from winning
    WIN_COMBINATIONS.each do |combo|
      if board.is_enemy?(combo[0], self) and board.is_enemy?(combo[1], self)
        return combo[2] if board.cells[combo[2]] != self.token
      elsif board.is_enemy?(combo[0], self) and board.is_enemy?(combo[2], self)
        return combo[1] if board.cells[combo[1]] != self.token
      elsif board.is_enemy?(combo[1], self) and board.is_enemy?(combo[2], self)
        return combo[0] if board.cells[combo[0]] != self.token
      end
    end
    return false
  end

  def move(board)
    if @mode == "easy"
      #random, no AI
      input = (rand(0..board.cells.length) + 1).to_s
      while !board.valid_move?(input) do 
        input = (rand(0..board.cells.length) + 1).to_s
      end
      board.update(input, self)
    else 
      #try defense first 
      if (move = defense_needed(board))
        move = (move + 1).to_s
        board.update(move, self) if board.valid_move?(move)
      else #try middle, then corners
        options = ["5", "1", "3", "7", "9", "2", "4", "6", "8"]
        counter = 0
        input = options[counter]
        while !(board.valid_move?(input))
          counter+=1
          input = options[counter]
        end
        board.update(input, self)
      end
    end
  end                  

end
