class Player::Computer < Player
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def move(board)
    # If the computer goes first: manually coded logic of a decent opponent
    if board.turn_count == 0
      return "1"
    elsif board.turn_count == 2 && board.position(9) == " "
      return "9"
    elsif board.turn_count == 2 && board.position(9) != " "
      return "7"
    elsif token == board.position(1) && token == board.position(9) && board.position(5) == " "
      return "5"
    elsif token == board.position(1) && token == board.position(7) && board.position(4) == " "
      return "4"
    elsif board.turn_count == 4 && board.position(5) == " "
      return "5"
    elsif board.turn_count == 4 && board.position(2) == " " && board.position(4) == " " && board.position(6) == " " && board.position(8) == " "  && board.position(3) == " "
      return "3"
    elsif board.turn_count == 4 && board.position(2) == " " && board.position(4) == " " && board.position(6) == " " && board.position(8) == " "  && board.position(7) == " "
      return "7"
    elsif board.turn_count == 4 && board.position(2) != " "
      return "8"
    elsif board.turn_count == 4 && board.position(4) != " "
      return "6"
    elsif board.turn_count == 4 && board.position(6) != " "
      return "4"
    elsif board.turn_count == 4 && board.position(8) != " "
      return "2"
    elsif board.turn_count == 6 && token == board.position(1) && token == board.position(3) && board.position(2) == " "
      return "2"
    elsif board.turn_count == 6 && token == board.position(1) && token == board.position(7) && board.position(4) == " "
      return "4"
    elsif board.turn_count == 6 && token == board.position(7) && token == board.position(9) && board.position(8) == " "
      return "8"
    elsif board.turn_count == 6
      first_open_position = board.cells.find_index(" ")
      return (first_open_position + 1).to_s
    elsif board.turn_count == 8
      first_open_position = board.cells.find_index(" ")
      return (first_open_position + 1).to_s
    
    ### If the computer goes second: 1) Pick a corner, 2)take advantage of a potential win, 3)play defensive, 4)random pick
    # pick a corner
    elsif board.turn_count == 1 && board.position(9) == " "
      return "9"
    elsif board.turn_count == 1 && board.position(5) == " "
      return "1"
    elsif board.turn_count > 2 && board.turn_count % 2 == 1
      WIN_COMBINATIONS.each do |x|
        # take advantage of any potential win
        if board.cells[x[1]] == token && board.cells[x[2]] == token && board.cells[x[0]] == " "
          return (x[0]+1).to_s
        elsif board.cells[x[0]] == token && board.cells[x[2]] == token && board.cells[x[1]] == " "
          return (x[1]+1).to_s
        elsif board.cells[x[0]] == token && board.cells[x[1]] == token && board.cells[x[2]] == " "
          return (x[2]+1).to_s
        # play defensive if they're about to win
        elsif board.turn_count > 2 && board.turn_count % 2 == 1 
          if token == "X"
            if board.cells[x[1]] == "O" && board.cells[x[2]] == "O" && board.cells[x[0]] == " "
              return (x[0]+1).to_s
            elsif board.cells[x[0]] == "O" && board.cells[x[2]] == "O" && board.cells[x[1]] == " "
              return (x[1]+1).to_s
            elsif board.cells[x[0]] == "O" && board.cells[x[1]] == "O" && board.cells[x[2]] == " "
              return (x[2]+1).to_s
            end
          elsif token == "O"
            if board.cells[x[1]] == "X" && board.cells[x[2]] == "X" && board.cells[x[0]] == " "
              return (x[0]+1).to_s
            elsif board.cells[x[0]] == "X" && board.cells[x[2]] == "X" && board.cells[x[1]] == " "
              return (x[1]+1).to_s
            elsif board.cells[x[0]] == "X" && board.cells[x[1]] == "X" && board.cells[x[2]] == " "
              return (x[2]+1).to_s
            end
          end 
        # random pick
        elsif board.turn_count > 2 && board.turn_count % 2 == 1
          first_open_position = board.cells.find_index(" ")
          return (first_open_position + 1).to_s
        end
      end
    end
    first_open_position = board.cells.find_index(" ")
    return (first_open_position + 1).to_s
  end

end