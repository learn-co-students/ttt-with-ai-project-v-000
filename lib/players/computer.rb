
module Players
  class Computer < Player

  def move(board)
    if !board.taken?(5)
      "5"
    elsif board.turn_count < 5
      ["1", "3", "7", "9"].find  {|input| !board.taken?(input)}
    else
      rand(1..9).to_s
    end
  end

  def block(board)
    count = -1
    until count == 7
      loop
      count +=1

     a = Game::WIN_COMBINATIONS[count].map {|i| !board.taken?(i)}
     if a.count {|t| t == true}  == 2 || a.count {|t| t == true} == 1
       b = a.index {|t| t == true}
       Game::WIN_COMBINATIONS[count][b] + 1
        break
     end
    end
  end


  end
end
