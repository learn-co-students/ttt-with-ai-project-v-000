class Players::Computer < Player

#On turn 1 always try to go in the middle if you can
#if not "try to go in a corner"
#otherwise try a random move

  def move(board)
    if board.valid_move?("5")
      "5"
    elsif corner_move(board) #goes for an available corner
          corner_move(board)
    else
        random_num(board)
      end
    end

 def corner_move(board)
    corner = [1, 3, 7, 9].sample.to_s
    if board.valid_move?(corner)
      corner
    end
  end



def random_num(board)
      random_move = rand(1..9).to_s
      if board.valid_move?(random_move)
        computer_move = random_move
      else
        move(board)
      end
    end

  end
