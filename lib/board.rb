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
  def position(input)
    position = input.to_i - 1
    @cells[position]
  end
  def full?
    something = true
    @cells.each do |x|
      if x == " "
        something = false
      end
    end
    something
  end

  def turn_count
    counter = 0
    @cells.each do |x|
      if x == "O" || x == "X"
        counter += 1
      end
    end
    counter
  end

  def taken?(position_passes)
    position = false
    position = true unless @cells[position_passes.to_i - 1] == " "
    position
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1, 9) && taken?(user_input) == false
  end

  def update(move, player)
    @cells[move.to_i - 1] = player.token
  end
end
