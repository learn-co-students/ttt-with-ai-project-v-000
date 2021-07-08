class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    i = 0
    @cells.each do |x|
      if x != " "
        i += 1
      end
    end
    i
  end

  def taken?(input)
    if @cells[input.to_i - 1] != " "
      true
    else
      false
    end
  end

  def valid_move?(input)
    if (1..9).include?(input.to_i) && !taken?(input)
      true
    else
      false
    end
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
end
