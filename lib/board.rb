require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells=[]
    self.reset!

  end

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts  "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts  "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "

  end

  def position(input)
      @cells[input.to_i-1]
  end

  def full?
    @cells.all?{|cell| cell == "X" || cell == "O"}
    # @cells.all? do |cell|
    #   if   cell == "X" || cell == "O"
    #     true
    #   else
    #     false
    #   end
    # end
  end

  def turn_count
    cells.count {|player| player == "X" || player == "O"}
  end

  def taken?(input)
    if self.position(input) ==  " "
      false
    else self.position(input) == "X" || "O"
      true
    end
  end

  def valid_move?(input)
    if !self.taken?(input) && input.to_i.between?(1,9)
      true
    else self.taken?(input) && !input.to_i.between?(1,9)
      false
    end

  end

  def update(input,player)
    @cells[input.to_i-1] = player.token
  end


end
