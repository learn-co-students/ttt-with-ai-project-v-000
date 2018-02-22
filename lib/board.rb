# board.rb
# 
# The Board class represents the data and logic of a Tic-tac-toe game board.
#


class Board

  attr_accessor :cells

  def initialize
    @cells = []
    9.times { @cells << " "}
  end

  def reset!
    @cells.clear
    9.times { @cells << " " }
  end

  def display
    puts "\n"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    @cells[position.to_i - 1]
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    occupied_cells = @cells.select {|item| item == "O" || item == "X"}
    occupied_cells.count
  end

  def taken?(position)
    @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O" ? true : false
  end

  def valid_move?(move)
    can = false
    position = move.to_i
    if position > 0 && position <= 9
       @cells[position.to_i - 1] == " " ? can = true : can = false
    end
    can
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end


  
  

  

end


