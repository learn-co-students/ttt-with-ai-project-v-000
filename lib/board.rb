class Board
  attr_accessor :cells
  @@all = []

  def initialize
    @cells = self.reset!
  end

  def cells
    @cells
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
    return @cells[pos.to_i - 1]
  end

  def update(pos, player)
    @cells[pos.to_i - 1] = player.token
  end

  def full?
    if @cells.include?(" ") == true
      return false
    else
      return true
    end
  end

  def turn_count
    turn = 0
    @cells.each do |cell|
      if cell != " "
        turn += 1
      end
    end
    return turn
  end

  def taken?(pos)
    if self.position(pos) == " "
      return false
    else
      return true
    end
  end

  def valid_move?(move)
    if move.to_i.between?(1,9) != true
      return false
    elsif self.taken?(move) == true
      return false
    else
      return true
    end
  end

end#
