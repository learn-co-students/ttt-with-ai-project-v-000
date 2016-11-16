class Board
  attr_accessor :cells

    def initialize
      @cells = Array.new(9, " ")
    end

    def reset!
      self.cells.clear
        self.cells = Array.new(9, " ")
    end

    def display
      print " #{cells[0]} | #{cells[1]} | #{cells[2]} ",
      "-----------",
      " #{cells[3]} | #{cells[4]} | #{cells[5]} ",
      "-----------",
      " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(user_input)
      new_user_input = user_input.to_i - 1
        self.cells[new_user_input]
    end

    def full?
      self.cells.all? { |token| token == "X" || token == "O" }
    end

    def turn_count
      self.cells.count { |token| token == "X" || token == "O" }
    end

    def taken?(user_input)
      new_user_input = user_input.to_i - 1
      new = self.cells[new_user_input]
        if new == "X" || new == "O"
          true
        else
          false
        end
    end

    def valid_move?(user_input)
        new_user_input = user_input.to_i - 1
        new = self.cells[new_user_input]
          if new == ""
            true
          else
            false
          end
      end



end
