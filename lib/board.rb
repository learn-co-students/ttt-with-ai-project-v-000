class Board

  attr_accessor :cells

    def initialize
      reset!
    end


    def reset!
      self.cells = Array.new(9," ")
    end

    def display
      puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
      puts "-----------"
      puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
      puts "-----------"
      puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(user_input)
      self.cells[user_input.to_i-1]
    end

    def full?
      self.cells.all?{|space| space != " "}
    end

    def turn_count
      self.cells.count{|space| space != " "}
    end

    def taken?(user_input)
      self.cells[user_input.to_i-1] != " "
    end

    def valid_move?(user_input)
      !taken?(user_input.to_i) && user_input.to_i.between?(1,9)
    end

    def update(user_input, player)
      self.cells[user_input.to_i-1] = player.token
    end


end
