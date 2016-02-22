class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    sep = "-----------"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts sep
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts sep
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    position = position.to_i - 1
    @cells[position]
  end

  def full?
    @cells.all? { |position| position == "X" || position == "O" } ? true : false

  end

  def turn_count
    counter = 0
    @cells.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(position)
    position = position.to_i - 1
    if @cells[position] == "" || @cells[position] == " " || @cells[position] == nil
      false
    elsif @cells[position] == "X" || @cells[position] == "O"
      true
    end
  end

  def valid_move?(position)
    position = position.to_i
    if taken?(position) || !(position.between?(1, 9))
      false
    else
      true
    end
  end

  def update(input, player)
    input = input.to_i - 1
    @cells[input] = player.token

  end
end
