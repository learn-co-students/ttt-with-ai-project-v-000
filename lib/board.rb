class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts  "-----------"
    puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts  "-----------"
    puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def index(location)
    location.to_i - 1
  end

  def position(location)

    @cells[self.index(location)]
  end

  def full?
    !(@cells.include?(" " || nil))
  end

  def turn_count
      count = 9
      @cells.each do |x|
        if x == " " || x == nil
          count -= 1
        end
      end
      count
  end

  def taken?(location)

    !(@cells[self.index(location)] == " ")
  end

  def valid_move?(location)
    !taken?(location) && location.to_i.between?(1,9)
  end

  def update(location, player)

    @cells[self.index(location)] = player.token
  end
end
