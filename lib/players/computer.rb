require "pry"

class Player::Computer < Player

  def move(board)
    win(board).to_s || block(board).to_s || random(board)
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

  def third_of_three(board)
binding.pry
    Game::WIN_COMBINATIONS.detect do |set_of_3|
      a = set_of_3[0]
      b = set_of_3[1]
      c = set_of_3[2]
      (board.cells[a] == board.cells[b] && board.cells[a] != " " ? true : false) || 
      (board.cells[a] == board.cells[c] && board.cells[a] != " " ? true : false) || 
      (board.cells[b] == board.cells[c] && board.cells[b] != " " ? true : false)
    end
  end

  def win(board)
    if third_of_three(board).detect {|x| board.cells[x] != " "} == self.token
      third_of_three(board).detect {|y| board.cells[y] == " "}
    end
  end

  def block(board)
    if third_of_three(board).detect {|x| board.cells[x] != " "} != self.token
      third_of_three(board).detect {|y| board.cells[y] == " "}
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


=begin
  def move(board)
    random = 1 + rand(9)
    random = random.to_s
    if board.valid_move?(random) == true
      random
    else
      move(board)
    end
  end

  def opponent_token
    self.token == "X" ? "O" : "X"
  end
=end

end