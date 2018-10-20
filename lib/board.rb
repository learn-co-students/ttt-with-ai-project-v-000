class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? do |token|
      token == "X" || token == "O"
    end
  end

  def turn_count
    counter = 0
    @cells.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(input)
    !(@cells[input.to_i - 1].nil? || @cells[input.to_i - 1] == " ")
  end

  def valid_move?(input)
    (input.to_i - 1).between?(0, 8) && @cells[input.to_i - 1] == " "
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end
