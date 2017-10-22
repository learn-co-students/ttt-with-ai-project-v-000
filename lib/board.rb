class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
  end 

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def full?
    # returns false for in progress, true for full board
    @cells.all? { |position| position != " "}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(index)
    # returns true if the position is X or O
    # returns false if the position is empty or blank
    @cells[index.to_i - 1] == "X" || @cells[index.to_i - 1] == "O"
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
    puts "Player #{player.token} moved to position #{index}"
    display
  end

end