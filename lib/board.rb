class Board
  attr_accessor :cells
  attr_reader :index

  @cells = []

  def initialize
    @cells = self.reset!
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(player_move)
    player_move.to_i - 1
  end

  def position(player_move)
    cells[input_to_index(player_move)]
  end

  def full?
    self.turn_count == 9
  end

  def turn_count
    self.cells.count{ | x | x == "X" || x == "O" }
  end

  def taken?(player_move)
    self.position(player_move) == "X" || self.position(player_move) == "O"
  end

  def valid_move?(player_move)
    input_to_index(player_move) >= 0 && input_to_index(player_move) <= 8 && !taken?(player_move)
  end

  def update(player_move, player)
    if valid_move?(player_move)
      self.cells[input_to_index(player_move)] = player.token
    end
  end
end
