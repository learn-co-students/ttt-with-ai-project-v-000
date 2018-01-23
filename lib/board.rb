class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," ",]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts " *** "
  end

  def position(j)
    @cells[j.to_i-1]
  end

  def update(j, player)
    @cells[j.to_i-1] = player.token
    display
  end

  def full?
    true if @cells.all?{|c| c != " "}
  end

  def turn_count
    temp=[]
    @cells.each do |c|
      temp << c if c != " "
    end
    temp.length
  end

  def taken?(j)
    if @cells[j.to_i-1] != " "
      true
    else
      false
    end
  end

  def valid_move?(j)
    if j.to_i > 0 && j.to_i < 10
      if taken?(j) == false
        true
      end
    end
  end
end
