class Board

  attr_accessor :cells

  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  def initialize
    reset
  end

  def reset
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def position(pos)
    @cells[pos.to_i - 1]
  end

  def full?
    @cells.all? do |token|
      token == "X" || token == "O"
    end
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(move)
    if @cells[move.to_i-1] == "X" || @cells[move.to_i-1] == "O"
      true
    elsif @cells[move.to_i-1] == " " || @cells[move.to_i-1] == ""
      false
    end
  end

  def valid_move?(pos)
    true if pos.to_i.between?(1,9) && taken?(pos) == false
  end

  def update(pos, player)
    @cells[pos.to_i-1] = player.token
  end

end