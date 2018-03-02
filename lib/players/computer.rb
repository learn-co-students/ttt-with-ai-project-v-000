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
      if !board.taken?(8)
        move = "8"


    end
  end

end
end
