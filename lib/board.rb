class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(user_input)
    i = input_to_index(user_input)
    self.cells[i]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    counter = 0
    self.cells.each do |space|
        counter += 1 if space == "X" || space == "O"
    end
    counter
  end

  def taken?(position)
    index  = input_to_index(position)
    !(self.cells[index].nil? || self.cells[index] == " ")
  end

  def valid_move?(position)
    index = input_to_index(position)
    index.between?(0,8) && !taken?(position)
  end

  def update(position, player)
    # binding.pry
    i =  input_to_index(position)
    self.cells[i] = player.token
  end

end
