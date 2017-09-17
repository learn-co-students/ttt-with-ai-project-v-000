class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts"-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def index
    @index
  end

  def clean_input(user_input)
    user_input.to_i - 1
  end

  def position(input)
    self.cells[self.clean_input(input)]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    count = 0
    self.cells.each do |value|
      if value == "X" || value == "O"
        count += 1
      end
    end
    count
  end

  def taken?(cell)
    self.position(cell) == "X" || self.position(cell) == "O"
  end

  def valid_move?(input)
    !self.taken?(input) && self.clean_input(input).between?(0,8)
  end

  def update(input, player)
    if valid_move?(input)
      self.cells[self.clean_input(input)] = player.token
    end
  end

end
