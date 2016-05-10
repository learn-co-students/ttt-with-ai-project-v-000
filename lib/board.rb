class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position_number)
    #"Please list the position which you would like to see the value of?"
    #position_number = gets.strip
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
    valid_move = true unless self.cells[number.to_i - 1] == "X" || self.cells[number.to_i - 1] == "O" || number.to_i < 1 || number.to_i > 9
    valid_move
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end

end
