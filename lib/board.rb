require "pry"

class Board

  #Attributes
  attr_accessor :cells, :turn_count

  #Initializer
  def initialize
    @cells = Array.new(9, " ")
    @turn_count = 1
  end

  #Methods
  #Displays the Board
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #Resets the current game Board
  def reset!
    @cells = Array.new(9, " ")
  end

  #Gets a position from the player for their move
  def position(input)
    index = input_to_index(input)
    @cells[index]
  end

  #Commits the move to the cells array
  def move(index, character)
    @cells[index] = character
    @cells
  end

  #Returns true if a given cells position is taken
  def taken?(input)
    index = input.to_i - 1
    if @cells[index] == " " || @cells[index] == "" #|| @cells[index] == nil
      false
    elsif @cells[index] == "X" || @cells[index] == "O"
      true
    end
  end

  #Returns true if there the requested move is valid
  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  #Converts users input to index in board array
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  #Returns true if cells is full
  def full?
    !@cells.detect{|i| i == " "}
  end

  #Returns true if cells is empty
  def empty?
    !@cells.detect{|i| i == "X" || i == "O"}
  end

  #Returns the amount of turns already played
  def turn_count
    @cells.count do |cell|
      cell != " "
    end
  end

  #Refreshes the board with the input of the player
  def update(position, player)
    index = input_to_index(position)
    move(index, player.token)
  end

end
