class Board
  attr_accessor :cells

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
    index = input.to_i - 1
    cells[index]
  end

  def full?
    cells.all? do |index|
      index != " "
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

  def taken?(position)
    index = position.to_i - 1
    cells[index] == "X" || cells[index] == "O"
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !taken?(position)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end



end
