class Board
  attr_accessor :cells
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} \| #{cells[1]} \| #{cells[2]} }"
    puts "-----------"
    puts " #{cells[3]} \| #{cells[4]} \| #{cells[5]} }"
    puts "-----------"
    puts " #{cells[6]} \| #{cells[7]} \| #{cells[8]} }"
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    counter = 0
    @cells.each do |x|
      if x == "X" || x == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(input)
    @cells[input.to_i - 1] == " " ? false : true
  end

  def valid_move?(input)
    input.to_i > 0 && input.to_i < 10 && !taken?(input) ? true : false
  end

  def update(input, player)
       turn_count.odd? ? @cells[input.to_i - 1] = "O" : @cells[input.to_i - 1] = "X"
  end

end
