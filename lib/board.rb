class Board
  attr_accessor :cells

  def initialize
    reset!

  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    @cells=[" "," "," "," "," "," "," "," "," "]
  end

  def position(spot)
    index=spot.to_i-1
    @cells[index]
  end

  def full?
    @cells.none? {|spot| spot == " "}
  end

  def turn_count
    count= 0
    @cells.each {|spot| count+=1 unless spot ==" "}
    count
  end

  def taken?(spot)
    index=spot.to_i-1
    if @cells[index]!=" "
      true
    else
    false
  end
  end

  def valid_move?(spot)
    if spot.to_i>=1 && spot.to_i<=9 && !taken?(spot)
      true
    else
      false
    end
  end

  def update(spot, player)
    @cells[spot.to_i-1]=player.token
  end



end
