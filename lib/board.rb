'require pry'

class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    cells.none? {|c| c == " "}
  end

  def turn_count
    count = 0
    cells.each do |p|
      if p == "X" || p == "O"
        count += 1
      end
    end
    count
  end

  def taken?(input)
    cells[input.to_i - 1] != " "
  end

  def valid_move?(input)
    input = input.to_i
    !taken?(input) && input.between?(1,9)
  end

  def update(position, player)
    cells[position.to_i - 1] = player.token
  end
end
