module Players
  class Computer < Player

  def move(board)
    move = nil

#first move--------
    #if first player, bottom right corner
      if !board.taken?(8)
        move = "8"

    #if second player, either bottom right, or top left
      elsif board.turn_count == 1
          if board.taken?(8)
            move = "0" else move "8"

#second move ---------
    #if first player, top left corner, if taken, top right or bottom left
  elsif board.turn_count == 3
      if !board.taken(0)
        move = "0" else move = "2"

    #if second player, bottom middle or right middle
  elsif board.turn_count == 4
      if !board.taken(5)
        move = "5" else move = "7"
#third move ----------


    #iterate through WIN_COMBINATIONS and see if any of the combos have at least two spaces filled
  elsif Game::WIN_COMBINATIONS.map {|i| if }

    end
  end

end
end
