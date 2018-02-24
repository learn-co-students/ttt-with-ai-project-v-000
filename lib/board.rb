class Board

  def initialize
    reset!
  end

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
    puts (" #{cells[0]} | #{cells[1]} | #{cells[2]} ")
    puts ("-----------")
    puts (" #{cells[3]} | #{cells[4]} | #{cells[5]} ")
    puts ("-----------")
    puts (" #{cells[6]} | #{cells[7]} | #{cells[8]} ")
  end

  def position(input)
    index = input.to_i - 1
    cells[index]
  end

  def full?
    cells.none? {|cell| cell == " "}
  end

  def turn_count
    turn_count = 0
    cells.each {|cell| if cell != " " then turn_count+=1 end }
    turn_count
  end

  def taken?(position)
    i = position.to_i - 1
    @cells[i] == "X" || @cells[i] == "O"
  end

  def valid_move?(position)
    i = position.to_i - 1
    i.between?(0,8) && !taken?(position)
  end

  def update(position, player)
    i = position.to_i - 1
    @cells.insert( i, player.token)
  end

end
