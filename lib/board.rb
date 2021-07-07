class Board
  attr_accessor :cells

  def initialize
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
    cells[input.to_i - 1]
  end

  def full?
    @cells.all? {|space| space == "X" || space == "O"}
  end

  def turn_count
    @cells.count {|token| token == "X" || token == "O"}
  end

  def taken?(input)
    index = input.to_i - 1
    if @cells[index] == "X" || @cells[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    index = input.to_i - 1
    index.between?(0,8) && !taken?(input)
  end

  def update(input, player)
    index = input.to_i - 1
    @cells[index] = player.token
  end
end
