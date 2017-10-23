require 'pry'

class Board

  attr_accessor :cells

  DIM = 3
  SIZE = DIM*DIM

  def initialize
    self.reset!
  end

  def reset!
    @cells = %w(\ ) * SIZE
  #https://stackoverflow.com/questions/1274675/what-does-warray-mean
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i-1
    cells[index]
  end

  def full?
    @cells.all? do |element|
      element == "X" || element == "O"
    end
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def taken?(input)
    #binding.pry
    index = input.to_i-1
    if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(input)
    index = input.to_i-1
    index.between?(0, 8) && !taken?(input)
  end

  def update(position, player_object)
    i = position.to_i-1
    cells[i] = player_object.token
    #you will set it equal to the token of the player object by calling the #token method on the player.
  end


end
