

class Board
  attr_accessor :cells

  def initialize()
    reset!
  end

  def reset!
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
    cells[input.to_i - 1]
  end

  def full?
    cells.none? do |token|
      token == " " || token.nil?
    end
  end

  def turn_count
    count = 0
    cells.each do |index|
      if index != " "
        count += 1
      end
    end
    count
  end

  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end

#  rspec spec/04_game_spec.rb
# load "config/environment.rb"


#        load "config/environment.rb"
