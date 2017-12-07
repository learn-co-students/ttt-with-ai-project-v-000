class Board
  attr_accessor :cells

  def initialize
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

  def position(n)
    @cells[n.to_i - 1]
  end

  def full?
    # true unless cells.include?(" ")
    @cells.none? { |board_index| board_index == " " || board_index == "" }
  end

  def turn_count
    counter = 0
    @cells.each do |e|
      if e == "X" || e == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(n)
    if @cells[n.to_i - 1] == "X" || @cells[n.to_i - 1] == "O"
      true
    else
      false
    end
  end

  def valid_move?(n)
    if n.to_i.between?(1, 9) && !taken?(n)
      true
    else
      false
    end
  end

  def update(n, player)
    @cells[n.to_i - 1 ] = player.token
  end
end
