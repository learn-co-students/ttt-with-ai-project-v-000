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

  def position(cell_position)
    cell_position = cell_position.to_i - 1
    cells[cell_position]
  end

  def full?
    if cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    counter = 0
    cells.each do |cell|
      if cell == "O" || cell == "X"
        counter += 1
      end
    end
    counter
  end

  def taken?(cell_position)
    cell_position = cell_position.to_i - 1
    cells[cell_position] == "X" || cells[cell_position] == "O" 
  end

  def valid_move?(cell_input)
    if cell_input.kind_of?(String) ## I added this to make my AI work properly
      cell_position = cell_input.to_i - 1
      cell_position.between?(0,8) && !taken?(cell_input)
    else
      false 
    end
  end

  def update(cell_position, player_token)
    cell_position = cell_position.to_i - 1
    cells[cell_position] = player_token.token
  end

end