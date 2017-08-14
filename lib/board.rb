class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end


  def position(input)
    cells[input.to_i - 1]
  end

  def update(input, player)
     cells[input.to_i - 1] = ""
  end

  def token

  end

  def full?
      cells.all?{ |full| full == "X" || full == "O"}
  end

  def turn_count
    #returns # of turns that have been played. odd turns are 'x' and even are 'o'
    counter = 0
      cells.each{ |turn| counter += 1 if turn == "X" || turn == "O"}
    counter
  end

  def taken?(input)
    cells[input.to_i - 1] == "X" || cells[input.to_i - 1] == "O"
  end

  def valid_move?(input)
    index = input.to_i - 1
    index.between?(0,8) && !taken?(input)
  end

end
