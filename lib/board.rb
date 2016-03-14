require 'pry'
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

  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end

  def position(location)
      !cells[location.to_i-1].nil?
      cells[location.to_i-1]
  end

  def full?
      @cells.all? do |cell|
      cell == "X" || cell == "O"
    end
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

  def taken?(position)
    cells[position.to_i-1] == "X" || cells[position.to_i-1] == "O"
  end

  def valid_move?(input_position)
    input_position.to_i.between?(1,9) && !taken?(input_position)
  end

  def update(input,player)
      cells[input.to_i-1] = player.token
  end

end