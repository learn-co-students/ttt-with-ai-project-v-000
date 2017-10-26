class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(cell_number)  # takes a string 1-9, returns what's in the cell
    num = cell_number.to_i
    if num.to_i < 10 && num.to_i > 0
      @cells[(num.to_i)-1]
    end
  end

  def full?
    full = true
    @cells.each do |cell|
      if cell == " "
        full = false
      end
    end
    full
  end

  def turn_count
    turn = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        turn += 1
      end
    end
    turn
  end

  def taken?(cell_number)
    taken = true
    if position(cell_number) == " "
      taken = false
    end
    taken
  end

  def valid_move?(cell_number)
    valid = true
    if taken?(cell_number) == true
      valid = false
    end
    valid
  end

  def update(cell_number, player)
    if valid_move?(cell_number)
      @cells[cell_number.to_i-1] = player.token
    end
  end
end
