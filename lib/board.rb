require 'pry'
class Board
  attr_accessor :cells
  
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
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
  
  def position(input)
    index =  input.to_i - 1
    @cells[index]
  end
  
  def update(input, player_object)
    index =  input.to_i - 1
    @cells[index] = player_object.token
  end
  
  def full?
    @cells.all? { |position| position == "X" || position == "O"}
  end
  
  def turn_count
    counter = 0
    @cells.each do |position|
      if position == "O" || position == "X"
        counter += 1
      end
    end
    counter
  end

  
  def taken?(input)
    index =  input.to_i - 1
    @cells[index] != " "
  end
  
  def valid_move?(input)
    index =  input.to_i - 1
    !taken?(input) && index.between?(0, 8)
  end

end