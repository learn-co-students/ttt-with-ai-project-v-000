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
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(location)
      new_location = location.to_i - 1
        self.cells[new_location]
    end

    def full?
      self.cells.all? { |token| token == "X" || token == "O" }
    end

    def turn_count
      cells.count {|current_move|current_move == 'X' || current_move == 'O'}
    end


    def taken?(location)
      new_location = location.to_i - 1
      new = self.cells[new_location]
        if new == "X" || new == "O"
          true
        else
          false
        end
    end

    def valid_move?(location)
      location.to_i.between?(1,9) && !self.taken?(location)
    end

    def update(location, player_token)
      self.cells[location.to_i - 1] = player_token.token
    end


end
