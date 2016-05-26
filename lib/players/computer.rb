
require "pry"

class Player::Computer < Player

  def move(board)
    (plus_one(board) || random(board).to_i).to_s
  end

  def plus_one(board)
    plus = win(board) || block(board)
    if plus != nil
      plus + 1
    end
  end

  def third_of_three(board)
    array = []
    Game::WIN_COMBINATIONS.each do |set_of_3|
      a = set_of_3[0]
      b = set_of_3[1]
      c = set_of_3[2]
      if (board.cells[a] == board.cells[b] && board.cells[c] == " " && board.cells[a] != " ") || 
      (board.cells[a] == board.cells[c] && board.cells[b] == " " && board.cells[a] != " ") || 
      (board.cells[b] == board.cells[c] && board.cells[a] == " " && board.cells[b] != " ")
        array << set_of_3
      end
    end
    array
  end

  def win(board)
    movement = nil
    third_of_three(board).each do |array|
      array.each do |x|
        if board.cells[x] == self.token
          movement = array.detect {|x| board.cells[x] == " "}
        end
      end
    end
    movement
  end

  def block(board)
    movement = nil
    third_of_three(board).each do |array|
      array.each do |x|
        if board.cells[x] != self.token && board.cells[x] != " "
          movement = array.detect {|x| board.cells[x] == " "}
        end
      end
    end
    movement
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
