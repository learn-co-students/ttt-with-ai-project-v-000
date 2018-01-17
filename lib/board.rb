class Board
  attr_accessor :cells

  def initialize(cells = nil)
    #We create a new instance variable with a blank array of 9 to store moves
    @cells = cells || Array.new(9, " ")
  end


  def reset!
    #we delete the array by creating a new array and assigning it to the same intance variable
    @cells = Array.new(9 , " ")
  end

  def display
    #we are displaying the board in a tic tac toe format each @cells[] represents a single element of our cells array
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    # the board is full unless we find a " " or a nil in the @cells array
    true unless @cells.detect {|square| square == " " || square == nil}
  end

  def turn_count
    #Set the counter = 0 to begin with. Unless our board element contains " " or a nil we will add to the counter then return the counter
    counter = 0
    @cells.each {|position| counter += 1 unless position == " " || position == nil}
    return counter
  end

  def taken?(input)
    position(input) == " " || position(input) == "" || position(input) == nil ? false : true
    #true unless position(input) == " " || position(input) == "" || position(input) == nil
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && taken?(input) == false
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end
end
