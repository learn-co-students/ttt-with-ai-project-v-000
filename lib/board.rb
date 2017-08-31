class Board
  attr_accessor :cells

  def initialize
    reset!
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def full?
    @cells.all? do |item|
      item == "X" || item == "O"
    end
  end

  def turn_count
    count = 0
    @cells.each do |item|
      if item == "X" || item == "O"
        count += 1
      end
    end
    count
  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def taken?(index)
    position(index) == "X" || position(index) == "O"
  end

  def valid_move?(index)    
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end


end