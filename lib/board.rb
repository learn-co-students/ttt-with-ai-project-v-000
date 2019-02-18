class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


  def display
    puts " #{@cells[0]} " + "|" + " #{@cells[1]} " + "|" + " #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} " + "|" + " #{@cells[4]} " + "|" + " #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} " + "|" + " #{@cells[7]} " + "|" + " #{@cells[8]} "
  end



  def position(position)
    cell = position.to_i - 1
    cells[cell]
  end

  def full?
    @cells.all? do |positions|
      positions == "O" || positions == "X"
    end
  end

  def turn_count
        counter = 0
    @cells.each do |turn|
        if turn == "X" || turn == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(index)
    index = index.to_i - 1
    @cells[index] == "X" || @cells[index] == "O"
  end

  def valid_move?(move)
    index = move.to_i - 1
    index.between?(0, 8) && !self.taken?(move)
  end

  def update(position, player)
    index = position.to_i - 1
    @cells[index] = player.token
  end

end
