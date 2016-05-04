class Board
  attr_accessor :cells

  def initialize(cells= nil)
    @cells = Array.new(9,' ')
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(n) #checks content of cell
    n = n.to_i-1
    @cells[n]
  end 

  def full? #checks to see if board is full
    !@cells.detect {|x| x == ' '}
  end

  def taken?(n) #checks to see if cell is taken
    n = n.to_i-1 
   !(@cells[n].nil? || @cells[n] == ' ')
  end

  def valid_move?(n) #checks to see if cell is valid and occupied
    n = n.to_i-1

    if !n.between?(0, 8) 
      false
    elsif @cells[n] == ' '
      true
    end
  end

  def update(n, player) #places player symbol in appropriate cell
    n = n.to_i-1
    @cells[n] = player.token
  end

  def turn_count #returns number of turns based on cell value
    @cells.count{|cell| cell == "X" || cell == "O"}
  end
end