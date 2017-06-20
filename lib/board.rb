class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "------------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "------------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""
  end

  def full?
     !(@cells.select{|space| space == " "}.length > 0)
   end

  def position(i)
    @cells[i.to_i-1]
  end

  def reset!
    @cells =  Array.new(9, " ")
  end

  def taken?(i)
    @cells[i.to_i-1] == "X" || @cells[i.to_i-1] == "O"
  end

  def turn_count
    @cells.select{|space| space == "O" || space == "X"}.length
  end

  def update(i, player)
    @cells[i.to_i - 1] = player.token
  end

  def valid_move?(i)
    i.to_i >0 && i.to_i<10 && !taken?(i)
  end
end
