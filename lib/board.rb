class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, ' ')
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

#   # def full? #boolean for if the board is full or not
#   #   !cells.any? { |cell| cell == ' ' }
#   # end
  def full?
    cells.all?{ |token| token == "X" || token == "O" }
 end

  def turn_count #count how many turns have been made in an instance of game
    @cells.count { |token| token != ' ' }
  end

  def taken?(input) #boolean to determine if the seleted location on the board is taken
    position(input) == 'X' || position(input) == 'O'  #check input value
  end

  def valid_move?(input) #boolean to determine if move is valid
    !taken?(input) && input.to_i.between?(1, 9)
  end

  def update(input, player) #update to next player
    @cells[input.to_i - 1] = player.token
  end

  def available_moves
    available = []
    @cells.each_with_index do |cell, index| 
      available << index if cell == " "
    end
    available
  end
end
