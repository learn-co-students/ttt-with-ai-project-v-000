class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9," ")
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
    cells.all? do |letter|
      if letter == "O" || letter == "X"
        true
      end
    end
  end

  def turn_count
    turn = 0
    cells.each do |letter|
      if letter == "X" || letter == "O"
        turn += 1
      end
    end
     turn
  end

  def taken?(input)
    position(input)=="X" || position(input)=="O"
  end

  def valid_move?(input)
    if input.to_i.between?(1,9) && !taken?(input)
      true
    end
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end
