module Players

class Computer < Player

  def move(board) #begin def
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    input = "0"
    if self.token == "X" #open if
      case board.turn_count #open case
      when 0
        input = "4"
      when 2, 4, 6, 8
            input = valid_moves.sample
        end #close case
      end #close if token = X

      if self.token == "O" #open if for O
        case board.turn_count #open case
        when 0
          input = "5"
        when 1, 3, 5, 7
          input = valid_moves.sample
          end #close case
        end #close if token O
        input
      end #end def

    end #close case
  end #close module
