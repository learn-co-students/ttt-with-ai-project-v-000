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
     cells[input.to_i - 1] = "#{player.token}"
  end

  def token
    turn_count % 2 == 0 ? "O" : "X"
  end

  def full?
      cells.all?{ |full| full == "X" || full == "O"}
  end

  def turn_count
    #returns # of turns that have been played. odd turns are 'x' and even are 'o'
      cells.count {|turn|  turn == "X" || turn == "O"}
  end

  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O"
  end

  def valid_move?(input)

    index = input.to_i - 1
  
    index.between?(0,8) && !taken?(input)

  end

end
