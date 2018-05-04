class Board
  attr_accessor :cells

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n"
  end

  def position(input)
    return @cells[input.to_i - 1]
  end

  def full?
    @cells.all? do |token|
      token == "X" || token == "O"
    end
  end

  def turn_count
    count = 0
    @cells.each do |token|
      puts "The number of turns that has been played is #{count}."
      if token == "X" || token == "O"
        count += 1
      end
    end
    count
  end

  def taken?(input)
    if @cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input)
    if input.to_i.between?(1,9) && !taken?(input)
      return true
    else
      return false
    end
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
end
