class Computer < Player

  WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5], 
  [6,7,8], 
  [0,3,6], 
  [1,4,7], 
  [2,5,8], 
  [0,4,8], 
  [6,4,2]]

  def move(board)
    best_move(board).to_s
  end

  def best_move(board)
    available_move = []
    board.cells.each_with_index do |cell, idx|
      if cell == " "
        available_move << idx
      end
    end
    if available_move.size > 6
     most_strategic(board) || super_defense(board) || random_move(board)
    else
    win_it(board) || block_it(board) || most_strategic(board) || random_move(board)
    end
  end 

  def random_move(board)
    #return a random among the available move
    available_move = []
    board.cells.each_with_index do |cell, idx|
      if cell == " "
        available_move << idx
      end
    end
    available_move.sample + 1
  end

  def nemesis
    @token == "X" ? "O" : "X"
  end

  def almost_winner(board, token)
    WIN_COMBINATIONS.find do |combo|
      ((board.cells[combo[0]] == board.cells[combo[1]]) && board.cells[combo[0]] == token && !board.taken?(combo[2]+1)) ||
      ((board.cells[combo[0]] == board.cells[combo[2]]) && board.cells[combo[0]] == token && !board.taken?(combo[1]+1)) ||
      ((board.cells[combo[2]] == board.cells[combo[1]]) && board.cells[combo[2]] == token && !board.taken?(combo[0]+1))
    end
    #return an array
  end

  def win_it(board)
    win_combo = almost_winner(board, @token)
    if win_combo != nil
      win_index = win_combo.find {|i| !board.taken?(i+1)}
      win_index.to_i + 1
    end
  end

  def block_it(board)
    lose_combo = almost_winner(board, self.nemesis)
    if lose_combo != nil
      lose_index = lose_combo.find {|i| !board.taken?(i+1)}
      lose_index.to_i + 1
    end 
  end

  def super_defense(board)
    if board.cells[0] == self.nemesis && board.cells[8] == " "
      9
    elsif board.cells[8] == self.nemesis && board.cells[0] == " "
      1
    elsif board.cells[2] == self.nemesis && board.cells[6] == " "
      7
    elsif board.cells[6] == self.nemesis && board.cells[2] == " "
      3 
    end 
  end

  def most_strategic(board)
    [5,1,3,7,9].find {|i| !board.taken?(i)}
  end

end 