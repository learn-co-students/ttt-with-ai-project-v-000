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

  def position(pos)
    cells[pos.to_i-1]
  end

  def full?
    cells.none?{|i| i == " "}
  end

  def turn_count
  counter = 0
    cells.each do |spot|
      if spot != " "
        counter += 1
      end
    end
  counter
  end

  def taken?(index)
    i = index.to_i-1
    cells[i] == "X" || cells[i] == "O"
  end

  def valid_move?(index)
    place = index.to_i-1
    place.between?(0,8) && taken?(place+1) != true
  end

  def update(position, player)
    cells[position.to_i-1] = player.token
  end

end
