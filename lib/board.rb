require 'pry'
class Board
  attr_accessor :cells, :player

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
      cells[input.to_i - 1]
      # binding.pry
  end

  def full?
    cells.all? { |cell| cell != " "  }
  end

  # def full?
  #   cells.all? do |cell|
  #     if cell == "X" || cell == "O"
  #       true
  #     else
  #       false
  #     end
  #   end
  # end

  # def turn_count
  #   count = 0
  #   @cells.each do |cell|
  #     if cell == "X" || cell == "O"
  #       count += 1
  #     end
  #   end
  #   count
  # end

  def turn_count
    cells.count { |char| char == "X" || char == "O" }
  end

  def taken?(input)
    position(input) != " "
  end

  # def taken?(input)
  #   position(input) == "X" || position(input) == "O"
  #   # binding.pry
  # end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
      # binding.pry
    # input.to_i.between?(1, 9) && position(input) == " "
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
    # binding.pry
  end


# Similarly, you're going to build an #update method that represents updating the board when a player makes a move.
# This method will take two arguments, the first will be the position the user wants
# to occupy in the form of 1-9 strings that you will need to convert to the board cells' array index,
# along with the player object making the move. When you update the appropriate index in the cells,
# you will set it equal to the token of the player object by calling the #token method on the player.

end
