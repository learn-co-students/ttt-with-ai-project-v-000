class Board
  attr_accessor :cells, :token

  def initialize(cells = nil)
    @cells = Array.new(9," ")
  end

  def cells
    @cells
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

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? {|x| x == "X" || x == "O"}
  end

  def turn_count
    counter = 0
    @cells.each {|x| counter += 1 if x == "X" || x == "O"}
    counter
  end

  def taken?(index)
    input = index.to_i - 1
    !(@cells[input].nil? || @cells[input] == " ")
  end

  def valid_move?(index)
    input = index.to_i
    input.between?(1,9) && !taken?(index)
  end

  def update(index, player)
    input = index.to_i - 1
    @cells[input] = player.token
  end
end
