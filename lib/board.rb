class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
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
    @cells[input.to_i-1]
  end

  def full?
    @cells.all?{|i| i == "O" || i == "X"}
  end

  def turn_count
    @cells.count{|i| i == "X" || i == "O"}
  end

  def taken?(input)
    if @cells[input.to_i-1] == "X" || @cells[input.to_i-1] == "O"
      true
    else @cells[input.to_i-1] == "" || @cells[input.to_i-1] == " "
      false
    end
  end

  def valid_move?(input)
    if taken?(input.to_i) == false && input.to_i.between?(1,9) == true
      true
    end
  end

  def update(input, player)
    cells[input.to_i-1]  = player.token
  end

end
