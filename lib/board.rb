class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts "-----------"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.count{|position| position != " "}
  end

  def taken?(input)
    @cells[input.to_i - 1] != " "
  end

  def valid_move?(input)
    if input.to_i.between?(1,9)
      @cells[input.to_i - 1] == " "
    else
      false
    end
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

  def valid_cells
    indeces = @cells.each_index.select{|i| @cells[i] == " "}
  end
end
