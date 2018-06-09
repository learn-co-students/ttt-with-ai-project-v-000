class Board #represents the data and logic of a Tic-tac-toe game board
  require 'pry'
  attr_accessor :cells
  #property cells that stores the data of the state of the board in an array
  @cells = []

  def initialize
    @cells = Array.new(9, " ") #or you can call reset! method
  end

  def reset!
    @cells = Array.new(9, " ") #1st argument is the number of elements in array 9, 2nd argument is the elements of the array " "
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "------------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "------------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(user_input) #takes in user input and returns the value of the board cell
    self.cells[user_input.to_i-1]#gets makes everything a string. Change to integer and minus 1 to get the array index.
  end

  def full? #when a method has a ? mark then the method will return true/false
    self.cells.all? {|char| char == "X" || char == "O"} #all? checks if every single array position has the condition
  end

  def turn_count #count returns the number of elements which is equal obj using ==
    self.cells.count {|char| char == "X" || char == "O"}
  end

  def taken?(user_input) #returns true if position is "X" or "O"
    position(user_input) == "X" || position(user_input) == "O"
    #use helper method position to check position has an X or O
    #other option:
    #position(user_input) != " "
  end

  def valid_move?(user_input) #returns true for user input 1-9 that is not taken
    user_input.to_i.between?(1,9) && !taken?(user_input)
  end

  def update(user_input, player)#2 arguments position and player
      self.cells[user_input.to_i-1] = player.token #stands for either X or O
  end

end
