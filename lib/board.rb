require 'pry'
class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    row_1 = " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    line = "-----------"
    row_2 = " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    row_3 = " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts row_1
    puts line
    puts row_2
    puts line
    puts row_3
  end

  def position(input)
    position = @cells[input.to_i - 1]
  end

  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    count = 0
    @cells.each do |cell|
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
    if input.to_i >= 1 && input.to_i <= 9 && self.taken?(input) == false
      true
    else
      false
    end
  end

  def update(move, player)
    @cells[move.to_i - 1]= player.token
  end

end
