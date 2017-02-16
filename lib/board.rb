class Board
attr_accessor :cells, :token

  def initialize
    reset!
  end# of initialize

  def reset!
    @cells = Array.new(9, " ")
  end# of reset!


def display
  puts "\n #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} \n"
end


def position(input)
  cells[input.to_i - 1]
end# of position


def update(position, player_object)
  cells[position.to_i - 1] = player_object.token
end# of update


def full?
  !@cells.include?(" ") 
end# of full


def turn_count
  @cells.select {|e| e != " "}.count 
end# of turn_count


def taken?(position) 
  @cells[position.to_i - 1] != " " 
end# of taken?


def valid_move?(position)
  position.to_i.between?(1,9) && !taken?(position)
end# of valid_move?


end# of class
