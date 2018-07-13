class Board
  attr_accessor :cells

  def initialize
    @cells = []
    reset!
  end

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(number)
    cells[number.to_i-1]
  end

  def full?
    spot_filled = []
    cells.each do |cell|
      if cell.include?("X") || cell.include?("O")
        spot_filled << true
      else
        spot_filled << false
      end
    end
    ( spot_filled.include?(false) ? false : true)
  end

  def turn_count
    turn_total = 0
    cells.each do |cell|
      turn_total += 1 if cell.include?("X") || cell.include?("O")
    end
    turn_total
  end

  def taken?(number)
    spot = number.to_i
    ( cells[spot-1] == "X" || cells[spot-1] == "O" ? true : false )
  end

  def valid_move?(number)
    ( number.to_i.between?(1,9) && !taken?(number) ? true : false )
  end

  def update(number, player)
    if !taken?(number) && valid_move?(number)
      cells[number.to_i-1] = player.token
    end
  end
end
