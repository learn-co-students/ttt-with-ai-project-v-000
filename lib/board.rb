class Board

  attr_accessor :cells

    def initialize
      self.cells = [" "," "," "," "," "," "," "," "," "]
    end

    def test
      puts "this is a test!!"
    end

    def reset!
      self.cells = [" "," "," "," "," "," "," "," "," "]
    end

    def display
      puts" #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
      puts"-----------"
      puts" #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
      puts"-----------"
      puts" #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(number)
      position_index = number.to_i - 1
      cells[position_index]
    end

    def full?

      cells.all?{|x| x != " "}
    end

    def turn_count
      turns = cells.collect{|x| x == "X" || x == "O"}
      turns.count {|x| x == true}
    end

    def taken?(location)
      value = cells[(location.to_i - 1)]
      !(value.nil? || value == " ")
    end

    def valid_move?(location)
      location.to_i.between?(1,9) &&  !taken?(location)
    end

    def update(location,player)
      cells[(location.to_i - 1)] = player.token
    end

end
