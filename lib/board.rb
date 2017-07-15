class Board
  attr_accessor :cells, :moves, :available

  def reset!
    @cells = Array.new(9, " ")
    @moves = Array.new
    @available = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def initialize
    self.reset!
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    !(@cells.any?{|pos| pos==" "})
  end

  def turn_count
    @cells.count {|x| x == "O" || x == "X"}
  end

  def taken?(input)
    index = input.to_i-1
    @cells[index] == "X" || @cells[index] == "O"
  end

  def valid_move?(input)
    if input.to_i.between?(1,9)
      index = input.to_i-1
      @cells[index] == " "
    end
  end

  def update(pos,player)
    @moves << pos.to_s
    @available.delete(pos.to_s)
    @cells[pos.to_i-1]=player.token
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""
  end

end
