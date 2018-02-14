class Board
  attr_accessor :cells

  def initialize
    self.reset!
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
    @cells.all? do |space|
      space == "X" || space == "O"
    end
  end

  def turn_count
    counter = 0
    @cells.each do |space|
      if (space == "X" || space == "O")
        counter += 1
      end
    end
    counter
  end

  def taken?(input)
    self.position(input) != " " ? true : false
  end

  def valid_move?(input)
    (self.taken?(input) ? false : true) unless input.length > 1
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end
