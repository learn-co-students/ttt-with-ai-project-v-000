
module Players
class Computer < Player
  def move(board) 
    if board.taken?("5")
      "5"
    else 
      computer_move = rand(1..9).to_s
    if board.taken?(computer_move)
      move
    else
      computer_move
    end
  end
  end

end
end