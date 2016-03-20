require 'pry'
class Player::Computer < Player

	def move(board)
    mid_corners(board) || win!(board) || block!(board) || whatever
 	end

  #make a move in the corners or the center
	def mid_corners(board)
		[1,3,5,7,9].find {|index| !board.taken?(index)}
	end

	def opp_token
	  if token == "X"
	  	"O" # == opp_token
	  else
	  	"X" # == opp_token if token == "O"
	  end
	end

	def whatever
	  (1..9).to_a.sample
	end

  def combo_detected(board, token)
    Game::WIN_COMBINATIONS.find do |combo|
      num1 = board.cells[combo[0]]
      num2 = board.cells[combo[1]]
      num3 = board.cells[combo[2]]
        
      (num1 == token && num1 == num2 && !board.taken?(combo[2]+1)) ||
      (num1 == token && num1 == num3 && !board.taken?(combo[1]+1)) ||
      (num2 == token && num2 == num3 && !board.taken?(combo[0]+1))
    end
  end

	# if player has two in a row, player should be able to complete the winning combo
  def win!(board)
    win_combo = combo_detected(board, self.token)
    win_combo.find do |index|
      !board.taken?(index+1)
    end
  end

  #if opponent has two a row, player should be able to block the winning combo
  def block!(board)
  	losing_combo = combo_detected(board, self.opp_token)
    losing_combo.find do |index|
      !board.taken?(index+1)
    end
  end

end



