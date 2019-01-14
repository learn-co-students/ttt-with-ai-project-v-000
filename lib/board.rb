class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position_number)
    int_position_number = position_number.to_i
    self.cells[int_position_number-1]
  end

  def full?
    full = true
    self.cells.each do |x|
      if x == " "
        full = false
      end
    end
    full
  end

  def turn_count
    turns = 0
    self.cells.each do |x|
      if x == "X" || x == "O"
        turns += 1
      end
    end
    turns
  end

  def taken?(position)
    taken = true
    taken = false unless self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
    taken
  end

  def valid_move?(number)
    valid_move = false
    valid_move = true unless self.taken?(number) || !number.to_i.between?(1,9)
    valid_move
  end

  def update(position, player)
    #binding.pry
    self.cells[position.to_i - 1] = player.token
  end

end
