class Board

  attr_accessor :cells

  #Cell board initially has 9 empty spots
  def initialize()
    reset!
  end

  #resets to an empty board
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  #prints out the board in the correct positions
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  #prints out the example board to the user so that they can see which
  #blocks are which
  def example
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
  end

  #Looks up the value in the given position
  def position(pos)
    cells[pos.to_i - 1]
  end

  #updates the board with the players token
  def update(position, player)
      cells[position.to_i - 1] = player.token
  end

  #checks to see if the board is full of Xs and Os
  def full?
    cells.all?{|piece| piece == "X" || piece == "O"}
  end

  #counts the number of turns that have occurred
  def turn_count
    cells.count{|piece| piece == "X" || piece == "O"}
  end

  #checks to see if a particular position is taken
  def taken?(pos)
    !(position(pos) == " " || position(pos) == "")
  end

  #checks to see if a move is valid by checking if the
  #position is on the board and if the spot is already taken
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

end