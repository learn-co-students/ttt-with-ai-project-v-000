require 'pry'

class Computer < Player

  def opponent_token
    token == "X" ? "O" : "X"
  end

  def move(board)
    if winning_move(board) # if you have two in a row, plays the third to get three in a row.
      (winning_move(board) + 1).to_s
    elsif block_opponent_win(board) #the opponent has two in a row, play the third to block them.
      (block_opponent_win(board) + 1).to_s
    elsif board.valid_move?("5") #tries to get the center position
      "5"
    elsif play_corner(board) #goes for an available corner
      play_corner(board)
    else
      random_move(board) #as a last resort, the computer tries random spots
    end
  end

  def winning_move(board)
   can_win_combo = Game::WIN_COMBINATIONS.detect {|combo| combo.count{|n| board.cells[n] == token} == 2 }
    if can_win_combo
      can_win_combo.detect {|empty_cell| board.cells[empty_cell] == " "}
    end
  end

  def block_opponent_win(board)
    opponent_win_combo = Game::WIN_COMBINATIONS.detect {|combo| combo.count{|n| board.cells[n] == opponent_token} == 2 }
    if opponent_win_combo
      opponent_win_combo.detect {|empty_cell| board.cells[empty_cell] == " "}
    end
  end

  def random_move(board)
    random_move = rand(1..9).to_s
    if board.valid_move?(random_move)
      computer_move = random_move
    else
      move(board)
    end
  end

  def play_corner(board)
    corner_spot = [1, 3, 7, 9].sample.to_s
    if board.valid_move?(corner_spot)
      corner_spot
    end
  end

end


