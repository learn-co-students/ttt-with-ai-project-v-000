class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position)
    cells[position.to_i - 1]
  end

  def full?
    if cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    turn_counter = 0
    cells.each do |cell|
      if cell != " "
        turn_counter+= 1
      end
    end
    turn_counter
  end

  def taken?(position)
    if position(position) != " "
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position.to_i.between?(1,9) && !taken?(position)
      true
    else
      false
    end
  end

  def update(position, character)
    cells[position.to_i - 1] = character.token
  end
end
