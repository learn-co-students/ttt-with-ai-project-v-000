require 'pry'
class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9," ")
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    if !cells.include?(" ")
      true
    else
      false
    end
  end

  def turn_count
     cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(board)
    if cells[board.to_i-1] != " "
      true
    else
       false
    end
  end

  def valid_move?(input)
    #binding.pry
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(board, player)
    cells[board.to_i-1] = player.token
  end

  #def available_spaces
    #self.cells.map.with_index {|a, i| a == "" ? i+1 : nil}.compact
  #end

end
