class Board
  def initialize
    @cells = Array.new(9, " "   )
  end

  def cells
    @cells
  end

  def cells=(array)
    @cells = array
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    # displays position
    @cells[pos.to_i-1]
  end

  def full?
    # returns if board is full
    @cells.each {|cell|
      if cell == " "
        return false
      end
    }
    true
  end

  def turn_count
    count = 0
    @cells.each {|cell|
      if cell != " "
        count += 1
      end
    }
    count
  end

  def taken?(pos)
    if position(pos) == "X" || position(pos) == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if input.to_i >= 1 && input.to_i <= 9
      if !taken?(input)
        return true
      end
    end
    false
  end


  def update(pos, player)
    @cells[pos.to_i - 1] = player.token
  end

end

