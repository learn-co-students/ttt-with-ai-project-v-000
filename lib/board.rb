class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    index = input.to_i
    cells[index - 1]
  end

  def full?
    @cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    count = 0
    @cells.each do |spot|
      if spot == "X" || spot == "O"
        count +=1
      end
    end
  count
  end

  def taken?(input)
  self.position(input) == "X" || self.position(input) == "O"
  end

  def valid_move? (input)
  input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
      index = input.to_i - 1
      @cells[index] = player.token
  end
end
