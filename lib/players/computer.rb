class Player::Computer < Player

    WINNERS = [[0,1,2],
              [3,4,5],
              [6,7,8],
              [0,3,6],
              [1,4,7],
              [2,5,8],
              [0,4,8],
              [6,4,2]]

    def move(board)
      move_combos = WINNERS.detect{|x| board.cells[x[0]] == "X" && board.cells[x[1]] == "X" && board.cells[x[2]] == " " || board.cells[x[0]] == "O" && board.cells[x[1]] == "O" && board.cells[x[2]] == " " || board.cells[x[0]] == "X" && board.cells[x[2]] == "X" && board.cells[x[1]] == " " || board.cells[x[0]] == "O" && board.cells[x[2]] == "O" && board.cells[x[1]] == " " || board.cells[x[1]] == "X" && board.cells[x[2]] == "X" && board.cells[x[0]] == " " || board.cells[x[1]] == "O" && board.cells[x[2]] == "O" && board.cells[x[0]] == " "}
        if move_combos != nil && move_combos[0] == " " && valid_move?(move_combos[0])
          computer_move = move_combos[0]
        elsif move_combos != nil && move_combos[1] == " " && valid_move?(move_combos[1])
          computer_move = move_combos[1]
        elsif move_combos != nil && move_combos[2] == " " && valid_move?(move_combos[2])
          computer_move = move_combos[2]
        else   
          computer_move = rand(1..9)
        end
      computer_move.to_s
    end



end


#  def move(board)
#    move_combos = WINNERS.detect{|x| board.cells[x[0]] == "X" && board.cells[x[1]] == "X" && board.cells[x[2]] == " " || board.cells[x[0]] == "O" && board.cells[x[1]] == "O" && board.cells[x[2]] == " " || board.cells[x[0]] == "X" && board.cells[x[2]] == "X" && board.cells[x[1]] == " " || board.cells[x[0]] == "O" && board.cells[x[2]] == "O" && board.cells[x[1]] == " " || board.cells[x[1]] == "X" && board.cells[x[2]] == "X" && board.cells[x[0]] == " " || board.cells[x[1]] == "O" && board.cells[x[2]] == "O" && board.cells[x[0]] == " "}
#      if move_combos != nil && move_combos[0] == " " && valid_move?(move_combos[0])
 #       computer_move = move_combos[0]
  #    elsif move_combos != nil && move_combos[1] == " " && valid_move?(move_combos[1])
   #     computer_move = move_combos[1]
    #  elsif move_combos != nil && move_combos[2] == " " && valid_move?(move_combos[2])
     #   computer_move = move_combos[2]
#      else   
 #     computer_move = rand(1..9)
  #    end
   # computer_move.to_s
 #end