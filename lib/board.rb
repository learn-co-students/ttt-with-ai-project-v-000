class Board

  attr_accessor :cells


    def initialize
      @cells = [" "," "," "," "," "," "," "," "," "]
    end

    def reset!
      self.cells = [" "," "," "," "," "," "," "," "," "]
    end

    def display
      print" #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
      print"-----------"
      print" #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
      print"-----------"
      print" #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(number)
      position_index = number.to_i - 1
      self.cells[position_index]
    end

    def full?
      self.cells.all?{|x| x != " "}
    end

    def turn_count
      turns = self.cells.collect{|x| x == "X" or x == "O"}
      turns.count {|x| x == true}
    end

    def taken?(location)
      value = self.cells[(location.to_i - 1)]
      !(value.nil? || value == " " || value == "")
    end

    def valid_move?(location)
      location.to_i.between?(1,9) &&  !taken?(location)
    end

    def update(location,player)
      self.cells[(location.to_i - 1)] = "X"

    end

end