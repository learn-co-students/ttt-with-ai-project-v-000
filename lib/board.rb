class Board
  attr_accessor :cells

  def reset! #Create a new blank Array
    @cells = Array.new(9, " ")
  end

  #initialize would create a new board aka cells representing the board
  def initialize
    reset!
  end

  #Defining the display board
  def display
    def dash
      puts "-----------"
    end
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    dash
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    dash
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #Takes in the user input of the position on the board and returns the current character
  def position(user_input)
    @cells[user_input.to_i-1]
  end

  #Checks if the board is full or not
  def full?
    @cells.all? {|token| token != " "}
  end

  #Counts the number of turns carried out by counting filled positions
  def turn_count
    @cells.count{|token| token != " "}
  end

  #Defining if the position to be occupied if filled or empty
  def taken?(user_input)
    position(user_input) != " "
  end

  #Checks if the move requested is valid or not
  def valid_move?(user_input)
    (user_input.to_i-1).between?(0,8) && !taken?(user_input)
  end

  #Defining the move to fill the board with character
  def update(user_input, player)
    @cells[user_input.to_i-1] = player.token
  end
end
