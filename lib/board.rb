require 'pry'
class Board
attr_accessor :cells, :token 

  def initialize
    reset!
  end# of initialize

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end# of reset!


def display
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end


def position(input)
  cells[input.to_i - 1]
end# of position


def update(position, player_object)
  cells[position.to_i - 1] = player_object.token 
end# of update 


def full?
  cells.none? {|p| p == nil || p == "" || p == " "} ? true : false
end# of full


def turn_count
  count = 0
  @cells.each do |cell| 
    if cell == "X" || cell == "O"
      count += 1
    end# of if
  end# of do
  count 
end# of turn_count


def taken?(position)
  cells[position.to_i - 1] == "X" || 
  cells[position.to_i - 1] == "O"
end# of taken?


def valid_move?(position)
  position.to_i.between?(1,9) && !taken?(position)
end# of valid_move?


end# of class