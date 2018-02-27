class Board

  def initialize
    reset!
  end

############################ BOARD PROPERITES ##################################

  def cells
    @cells
  end

  def cells=(cells)
    @cells = cells
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts (" #{cells[0]} | #{cells[1]} | #{cells[2]} ").blue
    puts ("-----------").blue
    puts (" #{cells[3]} | #{cells[4]} | #{cells[5]} ").blue
    puts ("-----------").blue
    puts (" #{cells[6]} | #{cells[7]} | #{cells[8]} ").blue
  end

  def position(input)
    cells[input.to_i - 1]
  end

############################ BOARD STATES ######################################

  def full?
    cells.none? {|cell| cell == " "}
  end

  def turn_count
    turn_count = 0
    cells.each {|cell| if cell != " " then turn_count+=1 end }
    turn_count
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    i = input.to_i - 1
    i.between?(0,8) && !taken?(input)
  end

######################## BOARD METHODS #######################################
  def update(input, player)
   cells[input.to_i - 1] = player.token
  end

end
