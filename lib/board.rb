class Board
  attr_accessor :cells, :player_position, :player

  def initialize
    @cells = Array.new(9," ")

  end

  def display
    puts " #{@cells[0]} " + "|" + " #{@cells[1]} " + "|" + " #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} " + "|" + " #{@cells[4]} " + "|" + " #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} " + "|" + " #{@cells[7]} " + "|" + " #{@cells[8]} "
  end

  def position(input)
    @player_position = input.to_i - 1
    @cells[@player_position]
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

  def full?
    if @cells.include?(" ")
      return false
    end
    true
  end

  def turn_count
    counter = 0
    @cells.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def valid_move?(input)
    if input.to_i < 1 || input.to_i > 9
      return false
    end
    if taken?(input)
      return false
    end
    return true
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def taken?(input)
    if position(input) != " "
      return true
    end
    return false
  end

end
