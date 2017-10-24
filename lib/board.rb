class Board

  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
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

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    if cells.all? {|cell| cell == "X" || cell == "O"}
      true
    else
      false
    end
  end

  def turn_count
    count = 0
    cells.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end

  def taken?(input)
    if self.position(input) == "X" || self.position(input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if input.to_i.between?(1,9)
      if taken?(input)
        false
      else
        true
      end
    end
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end
