class Board
  attr_accessor :cells, :turn_count, :exes, :oes

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
    @exes = []
    @oes = []
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def exes
    @exes = cells.map.with_index.map { |mark, i| i if mark == "X" }
  end

  def oes
    @oes = cells.map.with_index.map { |mark, i| i if mark == "O" }
  end

  def full?
    @cells.all? { |cell| cell != " " }
  end

  def taken?(pos)
    self.position(pos) != " "
  end

  def turn_count
    @cells.count { |cell| cell == "X" || cell == "O" }
  end

  def valid_move?(move)
    !self.taken?(move) && (1..9).include?(move.to_i)
  end

  def update(move, player)
    if valid_move?(move)
      index = move.to_i - 1
      @cells[index] = player.token
    else
      puts "Invalid move"
    end
  end
end
