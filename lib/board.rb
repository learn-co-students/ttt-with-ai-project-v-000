class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def cells
    @cells
  end

  def reset!
    self.cells=(Array.new(9, " "))
  end

  def display #Prints the Board
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position) #Takes in user input & returns the value of the board cell
    index = input_to_index(position)
    cells[index]
  end

  def full?
    cells.all? {|index| index == "X" || index == "O"}
  end

  def turn_count #Returns the amount of turns
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(num) #Returns false if the position is empty
    num = num.to_i - 1 if num.class == String
    !(cells[num].nil? || cells[num] == " ")
  end

  def valid_move?(position) # returns true for 1-9 that is not taken
    new_position = input_to_index(position)
    new_position.between?(0,8) && !taken?(new_position)
  end

  def update(position, player)
    index = input_to_index(position)
    cells[index] = player.token
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end
end
