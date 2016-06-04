class Board

  attr_accessor :cells

  def reset!
    #cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(location)
    #binding.pry
    @cells[location.to_i-1]
  end

  def full?
    occupied = cells.collect {|let| let == "X" or let == "O"}
    # occupied.delete_if {|x_y| x_y == false}
    if occupied.index(false)
      false
    else 
      true
    end
  end

  def turn_count
    self.cells.count {|cell| cell == "X" || cell == "O"}
    # occupied = cells.collect {|let| let == "X" or let == "O"}
    # occupied.delete_if {|x_y| x_y == false}
    # occupied.length
  end

  def taken?(position)
    new_position = position.to_i-1
    if cells[new_position] == "X" or cells[new_position] == "O"
      true
    else
      false
    end
  end

  def valid_move?(move)
    move = move.to_i
    if move > 0 && move < 10
      taken?(move).!
    #need to detect if the argument received is an integer from 1-9
    else
      false
    end
  end

  def update(position, player)
    #binding.pry
    p = position.to_i
    cells[p-1] = player.token
  end







end