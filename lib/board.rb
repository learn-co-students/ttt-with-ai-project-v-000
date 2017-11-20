require("pry")
class Board
  attr_accessor :cells

  def initialize
    self.reset!

  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def update(index, player)
    if !self.taken?(index)
      @cells[index.to_i - 1] = player.token
    end
  end

  def taken?(index)
    @cells[index.to_i - 1] != " "
    # binding.pry
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

  def valid_move?(index)
    index = index.to_i - 1
    return false if index < 0 || index > 8
    @cells[index] == " "
  end


end
