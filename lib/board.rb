class Board

  attr_accessor :cells

  def initialize(cells = Array.new(9, " "))
    @cells = cells
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-" * 11
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-" * 11
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    position = cells[input.to_i - 1]
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

  def full?
    !(cells.include?(" "))
  end

  def turn_count
    empty_cells = cells.select {|cell| cell == " "}
    turns_completed = (9 - empty_cells.length)
  end

  def taken?(input)
    cells[input.to_i - 1] == "X"||cells[input.to_i - 1] == "O"
  end

  def valid_move?(input)
    !taken?(input) && (1..9).include?(input.to_i)
  end



end