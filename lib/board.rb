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

  def position(move)
    @cells[move.to_i - 1]
  end

  def full?
    @cells.all? { |token| token == "X" || token == "O" }
  end

  def turn_count
    count = 0
    @cells.each do |token|
      if token == "X" || token == "O"
        count += 1
      end
    end
    count
  end

  def update(move, player)
    @cells[move.to_i - 1] = player.token
  end

  def taken?(location)
    self.position(location) == "X" || self.position(location) == "O"
  end

  def valid_move?(move)
    input = move.to_i - 1

    input.to_i.between?(0,9) && (self.position(move) == "" || self.position(move) ==" " || self.position(move)== nil)
  end

end
