class Board
  attr_accessor :cells, :player

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def position(space)
    @cells[space.to_i - 1]
  end

  def full?
   !@cells.include?(" ")
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell != " "
        counter += 1
      end
    end
    counter
  end

  def taken?(space)
    position(space) != " "
  end

  def valid_move?(space)
    space.to_i < 10 && space.to_i > 0 && taken?(space) == false
  end

  def update(space, player)
    @cells[space.to_i - 1] = player.token
  end


end
