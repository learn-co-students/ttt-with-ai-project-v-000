require 'pry'

class Board
  attr_accessor :cells #note attributes that can use accessor

  def initialize
    @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  #def cells=(cells)
    #@cells=[]
  #end

  def reset!
    @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

 def display
    print " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    print "-----------"
    print " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    print "-----------"
    print " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position (input)
    value=input.to_i-1

    if @cells[value] != " "
      return @cells[value]
    else
      return " "
    end
  end

  def full?
  # @cells.all? !=(" ")
   @cells.all? {|token| token == "X" || token == "O"}
  end

  def turn_count
    turns = 0
    @cells.each do |token|
      if token == "X" || token == "O"
        turns += 1
      end
    end
    turns
  end

  def taken?(input)
    value=input.to_i-1
    @cells[value] != " "
  end

  def valid_move?(input)
    value=input.to_i
    if !taken?(input) && value.between?(1,9)
    valid=true
    else
    valid=false
    end
  end

  def update (input, player)
    index=input.to_i-1
    @cells[index]=player.token

  end

  #def update(input, player)
    #cells[input.to_i-1] = player.token
  #end




end
