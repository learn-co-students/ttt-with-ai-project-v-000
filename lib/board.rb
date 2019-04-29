class Board
  attr_accessor :cells, :token

  def initialize
    @cells = Array.new(9, " ")
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

  def position(n)
    @cells[n.to_i - 1]
  end

  def full?
  if @cells.all? { |fill| fill == "X" || fill == "O" }
    return true
  end
  false
end

  def turn_count
    counter = 0
    @cells.each do |mark|
      if mark == "X" || mark == "O"
      counter += 1
    end
  end
    return counter
  end

  def taken?(index)
   @cells[index.to_i-1] == " " ? false : true
  end

  def valid_move?(index)
    !taken?(index) && index.to_i < 10 && index.to_i > 0
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end
end
