class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    @cells[position.to_i - 1]
  end

  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    @cells.count{|cell| cell != " "}
  end

  def taken?(choice)
    position(choice) == "X" || position(choice) == "O"
  end

  def valid_move?(choice)
    index = choice.to_i
    index.between?(1,9) && !taken?(index)
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end

end
