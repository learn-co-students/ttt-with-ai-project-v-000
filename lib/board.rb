class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} " 
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? do |char|
      char == "X" || char == "O"
    end
  end

  def turn_count
    @cells.count do |num|
      num == "X" || num == "O"
    end
  end

  def taken?(input)
    input = input.to_i 
    input = input - 1
    if @cells[input] == "X" || @cells[input] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if !taken?(input) && input.to_i.between?(1, 9)
      true
    else
      false
    end
  end

  def update(input, character = "X")
    @cells[input.to_i] == Player::Human

  end






end 




















