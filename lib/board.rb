class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells=(Array.new(9, " "))
  end

  def display #Prints the Board
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position) #Takes in user input & returns the value of the board cell
    index = input_to_index(position)
    @cells[index]
  end

  def full?
    @cells.all? {|index| index == "X" || index == "O"}
  end

  def turn_count #Returns the amount of turns
    turn = 0
    @cells.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    turn
  end

  def taken?(position) #Returns false if the position is empty
    position = position.to_i - 1 if position.class == String
    !(@cells[position].nil? || @cells[position] == " ")
  end

  def valid_move?(position) # returns true for 1-9 that is not taken
    new_position = input_to_index(position)
    new_position.between?(0,8) && !taken?(new_position)
  end

  def update(position, player)
    index = input_to_index(position)
    @cells[index] = player.token
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end
end
