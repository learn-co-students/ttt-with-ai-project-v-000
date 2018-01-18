class Board

  attr_accessor :cells

  def initialize()
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

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    cells.all?{|game_piece| game_piece == "X" || game_piece == "O"}
  end

  def turn_count
    @cells.count{|game_piece| game_piece == "X" || game_piece == "O"}
  end

  def taken?(location)
    !(position(location).nil? || position(location) == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input.to_i)
  end

  def update(location, game_piece)
    @cells[location.to_i - 1] = game_piece.token
  end
end