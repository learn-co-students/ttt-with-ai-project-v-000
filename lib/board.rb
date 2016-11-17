class Board
attr_accessor :cells
  @cells = [" "," "," "," "," "," "," "," "," "]

  def initialize
    reset!
  end


  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input) #takes in a user string 1-9, returns the value of that position--i.e. is it X, O, or " "
    index = input.to_i - 1
    return @cells[index]
  end

  def update(input, player) #makes the move that the person wants. sets a position = player's token X or O
    @cells[input.to_i - 1] = player.token
  end

  def full?
    @cells.all? do |position|
      position != " "
    end
  end

  def turn_count #returns the number of turns that have been played
    counter = 0
    @cells.each do |position|
      if position != " "
        counter += 1
      end
    end
    return counter
  end

  def valid_move?(input) #checks if a spot is actually 0-8, and if the spot is taken; returns true/false
    index = input.to_i - 1
    if taken?(input) == false && index.between?(0,8) == true
      return true
    else
      return false
    end
  end


  def taken?(input)
    index = input.to_i - 1
    if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
      return false
    else
      return true
    end
  end





end
