class Player::Computer < Player
require 'pry'

def move(board)
  if !board.taken?("5")
    "5"
  elsif !board.taken?("1")
    "1"
  elsif !board.taken?("2")
    "2"
  elsif !board.taken?("4")
    "4"
  elsif !board.taken?("7")
    "7"
  elsif !board.taken?("3")
    "3"
  else
    exp
end
end

def exp
  (0..8).to_a.sample.to_s
end

end
