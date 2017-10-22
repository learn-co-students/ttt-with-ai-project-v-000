class Board
  attr_accessor :cells

  def initialize()
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

  def position(index)
    @cells[index.to_i - 1]
  end

  def update(index, player)
    @cells[index.to_i-1] = player.token
  end

  def full?
    !@cells.include?(" ") ? true : false
  end

  def turn_count
    hash = Hash.new(0)
    @cells.each do |cell|
      hash[cell] += 1
    end
    9-hash[" "]
  end

  def taken?(index)
    position(index) == "X" || position(index) == "O" ? true : false
  end

  def valid_move?(index)
    index.to_i >=1 && index.to_i <=9 && !taken?(index) ? true : false
  end

end
