require 'pry'

class Board
attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset! #reset the state of the cells to what a board should look like at the start of a game
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def position(input) #takes in the user's input in the form of 1-9 strings
    index = input_to_index(input)
    self.cells[index]
  end

  def update(move, player=X) #updating the board when a player makes a move
    self.cells[input_to_index(move)] = player
  end

  def full?
    !self.cells.include?(" ")
  end

  def taken?(move)
    self.cells[input_to_index(move)]== " " ? false : true
  end

  def valid_move?(move)
    move.to_i.between?(1,9) && taken?(move) == false ? true : false
  end

  def turn_count
    count = 0
    self.cells.each {|cell|
      cell != " " ? count += 1 : nil
    }
    count
  end

  def display #print its current state
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

end
