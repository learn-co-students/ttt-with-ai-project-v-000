class Board
  attr_accessor :cells

  def initialize(cells = nil)
    if cells == nil
      @cells = Array.new(9, " ")
    else
      @cells = cells
    end
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    i = 0
    3.times do 
      puts " #{self.cells[i]} | #{self.cells[i+1]} | #{self.cells[i+2]} "
      puts "-----------"
      i += 3
    end
  end

  def position(position)
    if position.is_a?(String)
      position = position.to_i - 1 
    end 
    
    self.cells[position]
  end

  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    count = self.cells.count{|cell| cell == "X" || cell == "O"}
  end

   def taken?(input)
    !(position(input) == " " || position(input) == "")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(cell, player)
    cell = cell.to_i - 1
    self.cells[cell] = player.token
  end

   def available_spaces
      available = []
      spaces.each_index do |i|
        available << i if space_available?(i)
      end
      available
    end
end