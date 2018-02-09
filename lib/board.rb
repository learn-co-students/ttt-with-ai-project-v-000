class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    cells.clear
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
    cells.all? {|spot| spot == "X" || spot == "O"}
  end

  def turn_count
  counter = 0
  cells.each do |spot|
    if spot == "X" || spot == "O"
      counter += 1
      end
    end
  counter
  end

  def taken?(input)
    spot = input.to_i - 1
    if cells[spot] == "X" || cells[spot] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if !taken?(input) && input.to_i.between?(1,9)
      true
    else
      false
    end
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end



end
