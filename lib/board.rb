class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(x)
   input = cells[x.to_i - 1]
    input
  end

  def full?
    cells.none? {|cell| cell == " "}
  end

  def turn_count
  cells.count{|token| token == "X" || token == "O"}
    the_count = cells.count {|cell| cell == " "}
    turn = 9 - the_count
    turn
  end


  def taken?(input)
    if cells[input.to_i - 1] == "X" || cells[input.to_i - 1] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    taken?(input) == false && input.to_i.between?(1, 9)
  end

  def update (input, player)
    cells[input.to_i - 1] = player.token
  end


end
