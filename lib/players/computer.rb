# computer.rb  Computer player class
module Players

  class Computer < Player

    CORNERS = ["1", "3", "7", "9"]

    def corners
      CORNERS
    end

    def first_player?(board)
      if board.cells.count {|item| item == " "} == 9
        true
      else
        false
      end
    end

    def center_open?(board)
      if board.cells[4] == " "
        true
      else
        false
      end
    end

    def opposing_token
      self.token == "O" ? "X" : "O"
    end
    
    

    def move(board)
      puts "\nIt's the computer's(#{self.token}) turn.\n\n"
      if first_player?(board)
        # Take corner square if first
        answer = corners.sample

      elsif center_open?(board)
        # Take center if available
        answer = "5"

      else 
        answer = board.cells.each_index.select{|i| board.cells[i] == " "}
        answer = answer.first + 1
        answer.to_s
      end


    end

  end

end

