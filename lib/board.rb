class Board
  attr_accessor :cells

  def initialize(cells=nil)
    @cells = cells || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input) 
    @cells[(input.to_i) - 1]
  end

  def full?
    @cells.all?{|i| i == "X" || i == "O"}
  end

  def turn_count
    @cells.count{|turn| turn == "X" || turn == "O"}
  end

  def taken?(input)
    !(position(input).nil? || position(input) == " ")
  end

  def valid_move?(input)
    if taken?(input) == true
      false
    elsif taken?(input) == false && (1..9).cover?(input.to_i) == true
     true
    end
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end




