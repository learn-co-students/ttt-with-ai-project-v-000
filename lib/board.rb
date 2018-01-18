class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end
  
  # This #display method I essentially copy and pasted from the earlier tic-tac-toe projects before I learned about Enumberables and iterative methods like #each
  def display
    counter = 0
    2.times do
      puts " #{self.cells[counter]} | #{self.cells[counter+1]} | #{self.cells[counter+2]} "
      puts "-----------"
      counter += 3
    end
    puts " #{self.cells[counter]} | #{self.cells[counter+1]} | #{self.cells[counter+2]} "
  end

  def position(cell_number)
    self.cells[cell_number.to_i - 1]
  end

  def full?
    self.cells.all? { |cell| cell != " "  }
  end

  def turn_count
    self.cells.count do |cell|
      cell == "X" || cell == "O"
    end
  end

  def taken?(cell_number)
    position(cell_number) != " "
  end

  def valid_move?(cell_number)
    (1..9).any? { |number| number.to_s == cell_number } && !taken?(cell_number)
  end

  def update(cell_number,player)
    self.cells[cell_number.to_i-1] = player.token
  end
  
end