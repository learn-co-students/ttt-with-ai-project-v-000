class Board
  attr_accessor :cells

  @cells = []

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    if cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    cells.count {|input| input != " "}
  end

  def taken?(input)
    if @cells[input.to_i - 1].include?(" ")
      false
    else
      true
    end
  end

  def valid_move?(input)
    if input.to_i > 0 && input.to_i < 10 && @cells[input.to_i - 1] == " "
      true
    else
      false
    end
  end

  def update(position, player)
    @cells.fill(player.token, position.to_i-1)
  end

end
