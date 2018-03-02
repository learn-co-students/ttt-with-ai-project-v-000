module Players
  class Computer < Player

    WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],  #<---- you can call this with Game::WIN_COMBINATIONS
     [6,4,2],
     [0,4,8]
    ]



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





    end
  end

end
end
