class Board
  attr_accessor :cells

  def initialize
    @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} \n\n"
  end

  def position(spot)
    cells[spot.to_i-1]
  end

  def update(spot, player)
      cells[spot.to_i-1] = player.token
  end

  def all_X
    ex = []
    cells.each_with_index do |p, i| 
      if p == "X"
        ex << i
      end
    end
    ex
  end

  def all_O
    oh = []
    cells.each_with_index do |p, i| 
      if p == "O"
        oh << i
      end
    end
    oh
  end

  def all_open
    open = []
    cells.each_with_index do |p, i| 
      if p == " "
        open << i
      end
    end
    open
  end

  def token
  end

  def turn_count
    counter = 0
    cells.each do |spot|
      if spot == "X" || spot == "O"
      counter += 1
      end
    end
    counter
  end

  def valid_move?(spot)
    spot.to_i.between?(1,9) && !taken?(spot)
  end

  def full?
    cells.all? {|spot| spot == "X" || spot == "O"}
  end

  def taken?(spot)
    spot = spot.to_i-1
    cells[spot] == "X" || cells[spot] == "O"
  end



end
