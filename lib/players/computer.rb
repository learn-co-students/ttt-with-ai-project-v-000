require 'pry'
class Player::Computer < Player

  def move(board)
    if !board.taken?("5")
      "5"
    else
      win!(board) || block!(board) || corner(board) || whatever
    end
  end

  #make a move in the corners or the center
  def corner(board)
    [1,3,7,9].find {|index| !board.taken?(index)}
  end

  def opp_token
    if token == "X"
      "O" # == opp_token
    else
      "X" # == opp_token if token == "O"
    end
  end

  def whatever
    [1,2,3,4,5,6,7,8,9].sample
  end

  #detects two in a row on the board
  def combo_detected(board, token)
    Game::WIN_COMBINATIONS.find do |combo|
      num1 = board.cells[combo[0]]
      num2 = board.cells[combo[1]]
      num3 = board.cells[combo[2]]

      (num1 == token && num1 == num2 && num3 == " ") ||
      (num1 == token && num1 == num3 && num2 == " ") ||
      (num2 == token && num2 == num3 && num1 == " ")
    end
  end

	# if player has two in a row, player should be able to complete the winning combo
  def win!(board)
    win_combo = combo_detected(board, self.token)
    if win_combo 
      win_combo.find {|index| !board.taken?(index+1)} + 1
    end
  end
   
  #if opponent has two a row, player should be able to block the winning combo
  def block!(board)
  	losing_combo = combo_detected(board, self.opp_token)
    if losing_combo 
      losing_combo.find {|index| !board.taken?(index+1)} + 1
    end
  end

end



