module GameStatus

  def board
    @board
  end
  
  def board=(board)
    @board = board
  end


WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]




def won?
    WIN_COMBINATIONS.each do |combo|
      if (board.cells[combo[0]] != " ") && (board.cells[combo[0]] == board.cells[combo[1]]) && (board.cells[combo[1]] == board.cells[combo[2]])
        @winner = board.cells[combo[0]]
        return true
      end

    end
    if @winner == nil
      return false
    end
  end

  def draw?
        if !won?  && board.full? == true
            return true
        end
    end

  def over?
    won? || draw?
  end


end