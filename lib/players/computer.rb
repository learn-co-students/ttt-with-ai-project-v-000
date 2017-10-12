module Players

  class Computer < Player

    COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def move(board)
      if win?(board)
        win?(board)
      elsif block?(board)
        block?(board)
      elsif board.valid_move?("5")
        "5"
      else
        random_move(board)
      end
    end

    def random_move(board)
     comp_move = rand(1..9).to_s
     if board.valid_move?(comp_move)
       comp_move
     else
       random_move(board)
     end
    end

    def win?(board) #check if there's a possibility to win
      COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == "O" && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
          return (combo[2]+1).to_s
        elsif board.cells[combo[0]] == "O" && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
          return (combo[1]+1).to_s
        elsif board.cells[combo[1]] == "O" && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
          return (combo[0]+1).to_s
        end
      end
      false
    end

    def block?(board) #check if need to block the opponent
      COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == "X" && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
          return (combo[2]+1).to_s
        elsif board.cells[combo[0]] == "X" && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
          return (combo[1]+1).to_s
        elsif board.cells[combo[1]] == "X" && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
          return (combo[0]+1).to_s
        end
      end
      false
    end

  end

end
