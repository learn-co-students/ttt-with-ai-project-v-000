

class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
  end

  def cells
    @cells
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    @cells.all? { |cell| cell=="X" || cell=="O" }
  end

  def turn_count
    turns = @cells.count("X") + @cells.count("O")
    turns
  end

  def taken?(input)
    index = input.to_i - 1
    if @cells[index] == "X" || @cells[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    index = input.to_i - 1
    if 0 < input.to_i && input.to_i < 10 && @cells[index] == " "
      true
    end
  end

  def update(position, player)
    index = position.to_i - 1
    @cells[index] = player.token
    puts "good move player #{player.token} :)"
    puts ""
  end


end
