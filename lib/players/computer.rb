require "pry"

class Player::Computer < Player

  def move(board)
    win(board) || block(board) || random(board)
    #random(board)
  end
  
=begin
block and win based off similar method called third_of_three
prioritze win, then block, then corners, then middle, then random
do i need opponent token?
  I can just use != self.token
do we need a win and block?
  yes, what if there are both options on board

things to fix current error
change third of thee detect parameters to ||
=end

########this method basically returns the 
########winning combo that is two thirds complete
  def third_of_three(board)
    Game::WIN_COMBINATIONS.detect do |set_of_3|
      a = set_of_3[0]
      b = set_of_3[1]
      c = set_of_3[2]
      ((board.cells[a] == board.cells[b] && board.cells[a] != " ") || 
      (board.cells[a] == board.cells[c] && board.cells[a] != " ") || 
      (board.cells[b] == board.cells[c] && board.cells[b] != " "))
    end
  end

  def win(board)
    place_holder = third_of_three(board)
    if place_holder && place_holder.count {|z| board.position(z+1) == self.token} == 2
      place_holder.detect {|y| board.cells[y] == " "}
    end
  end

  def block(board)
    place_holder = third_of_three(board)
    if place_holder && place_holder.count {|z| board.position(z+1) != self.token && board.position(z+1) != " "} == 2
      place_holder.detect {|y| board.cells[y] == " "}
    end
  end

  def random(board)
    num = 1 + rand(9)
    num = num.to_s
    if board.valid_move?(num) == true
      num
    else
      random(board)
    end
  end

end