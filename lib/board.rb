class Board

  attr_accessor :cells, :token

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(move)
    @cells[move.to_i - 1]
  end

  def full?
    if @cells.all? { |c| c == "X" || c == "O" }
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    self.cells.each do |token|
      if token == "X" || token == "O"
         counter += 1
      end
    end
    counter
  end


  def taken?(move)
    !(position(move) == " ")
  end

  def valid_move?(move)
    if taken?(move) == false && move.to_i <= 9 && move.to_i >= 1
      true
    else
      false
    end
  end

  def update(move, player)
    @cells[move.to_i - 1] = player.token
  end

end
