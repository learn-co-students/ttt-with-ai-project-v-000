class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(num)
    "#{cells[num.to_i-1]}"
  end
  
  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"} ? true : false
  end

  def turn_count
    counter = 0
      self.cells.each do |cell| if cell == "X" || cell == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(position)
    @cells[position.to_i-1] == "X" || @cells[position.to_i-1] == "O" ? true : false
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position) ? true : false
  end

  def update(cell, player)
    self.cells[cell.to_i-1] = player.token
  end




end