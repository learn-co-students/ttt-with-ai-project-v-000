class Board
  attr_accessor :cells
  attr_reader :corners
  @cells = []
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    puts "*******************************************"
  end
  def position (cell_number)
    @cells[cell_number.to_i - 1]
  end
  def full?
   @cells.all? do |cell_number|
     cell_number == "X" || cell_number == "O"
    end
  end
  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell == "X" or cell == "O" then
        counter += 1
      end
    end
    return counter
  end
  def taken?(cell_number)
     spot = cell_number.to_i - 1
    !(@cells[spot].nil? || @cells[spot] == " ")
  end
  def corners_taken?
    [1,3,7,9].all? do |corner|
        taken?(corner)
      end
    end

  def valid_move?(cell_number)
    spot = cell_number.to_i
    if spot.between?(1,9) and position(spot) == " " then
      return true
    else
      return false
    end
  end
  def update(spot,player)
    cell_number = spot.to_i - 1
    @cells[cell_number] = player.token
    display
  end
end
