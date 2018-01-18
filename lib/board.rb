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

  def position(string_input)
    @cells[string_input.to_i - 1]
  end

  def full?
    @cells.all? {|cell| cell != " "}
  end

  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(string_input)
    position(string_input) != " "
  end

  def valid_move?(string_input)
    string_input.to_i.between?(1,9) && !taken?(string_input)
  end

  def update(string_input, player)
    @cells[string_input.to_i - 1] = player.token if valid_move?(string_input)
  end
end
