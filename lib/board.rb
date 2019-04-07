

class Board
  attr_accessor :cells

    def initialize
      reset!
    end

    def reset!
      self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(user_input)
      cells[user_input.to_i - 1]
    end

    def full?
      cells.none? { |position| position == nil || position == "" || position == " " }
    end

    def turn_count
      cells.count { |each_cell| each_cell == "X" || each_cell == "O"}
    end

    def taken?(wanted)
      position(wanted) == "X" || position(wanted) == "O"
      # cells[wanted.to_i - 1 ] == "X" || cells[wanted.to_i - 1] == "O"
    end

    def valid_move?(user_input)
      user_input.to_i.between?(1, 9) && !taken?(user_input)
    end

    def update(position_wanted, player)
      cells[position_wanted.to_i - 1] = player.token
    end

end #<----------CLASSend
