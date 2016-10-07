module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    # CORNERS = []

    def move(board)
      if board.valid_move?(5)
        "5"
      else
        move = rand(1..9)
      end
    end
    #  if (false)
    #  else
    #    next_best_move(board)
    #  end

    # go through and check if all the positions needed in the combination are free, if they are, start making those moves

    #  def next_best_move(board)
    #   #  random_array = Random.rand(1..9)
    #    Game::WIN_COMBINATIONS.find do |wc|
    #          binding.pry
    #        end
    #      end
    #    end
    #  end

  end #close class
end #close module
