require 'pry'
class Board
  attr_accessor :cells, :user_input

  def initialize (cells = [" "," "," "," "," "," "," "," "," "])  #default(cells=array)
    @cells = cells
  end

  def cells=(cells)
    @cells = cells
  end

  def cells
    @cells
  end

  def reset!
    cells.clear
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    cells.all? do |element|
      element == "X" || element == "O"
    end
  end

  def turn_count #counts occupied positions
    counter= 0
    @cells.each do |element|
      if element== "X" || element== "O"
        counter +=1
      end
    end
    counter  #after .each do returns array, i need to put counter to get a number
  end

  def taken?(location)
    location = location.to_i-1
    @cells[location] != " " && @cells[location] != ""
  end

  def valid_move?(input)
    index = input.to_i-1
    index.between?(0,8) && !taken?(input)
  end

  def update(index, current_player = "X")
    index = index.to_i-1
    @cells[index] = current_player.token
  end

end
