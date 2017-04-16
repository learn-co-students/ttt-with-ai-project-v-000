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
    index = input_to_index(position)
    !(@cells[index].nil? || @cells[index] == " ")
  end

  def valid_move?(position) # returns true for 1-9 that is not taken
    position.to_i.between?(1,9) && !taken?(position)
  end

  def update(position, player)
    index = input_to_index(position)
    @cells[index] = player.token
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end
end
