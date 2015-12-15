class Board

  attr_accessor :cells

  #initializes game board with array of single empty spaces
  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts "\n #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n"
  end

  #resets board to initialized state
  def reset!
    @cells = Array.new(9," ")
  end

  #returns character at specified location
  def position(input)
    @cells[input.to_i-1]
  end

  #determines if board is full by checking for empty space in array
  #returns true/false
  def full?
    @cells.all?{|element| element != " "}
  end

  #counts # of non empty-spaces to determine current turn count
  #returns turn count (integer)
  def turn_count
    count = 0
    @cells.each do |element|
      count += 1 if element != " "
    end
    count
  end

  #determines if location has been used by checking for emptty space
  #returns true/false
  def taken?(input)
    position(input) != " "
  end

  #checks to see if input is valid || move is valid
  #returns true/false
  def valid_move?(input)
    return false if input.to_i < 1 || input.to_i > 9
    taken?(input) == false
  end

  #updates the specified location with player character
  def update(input,player)
    @cells[input.to_i-1] = player.token
  end

  def undo(input)
    @cells[input-1] = " "
  end
end