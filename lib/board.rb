class Board
  attr_accessor :cells, :player

  def initialize(player="X")
    @cells = Array.new(9, " ")
    @player = player
  end

  def cells
    @cells
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def update(position, player)
    @cells[position.to_i-1] = player.token
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    9-@cells.select {|space| space == " "}.length
  end

  def taken?(index)
    (@cells[index.to_i-1].strip == "X" || @cells[index.to_i-1].strip == "O") ? true : false
  end

  def valid_move?(index)
    (index.to_i-1).between?(0,8) && !taken?(index.to_i)
  end

  def reset!
    @cells = Array.new(9, " ")
  end

end
