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
    puts '-----------'
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts '-----------'
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "\n"
  end

  def input_index(input) # this one line is all over the place!
    input.to_i - 1
  end

  # position method
  def position(input)
    @cells[input_index(input)]
  end

  # define full here - every element on the board contains "X" or "O"
  def full?
    @cells.all? do |mark|
      mark == 'X' || mark == 'O'
    end
  end

  # define turn_count here
  def turn_count
    cells.count { |occupied_spot| occupied_spot != " " }
#    counter = 0
#    @cells.each do |occupied_spot|
#      counter += 1 if occupied_spot != ' '
#    end
#    counter
  end

  # taken? method
  def taken?(input)
    exxo = position(input)
    exxo != " " ? true:false
  end

  # valid_move? method here
  def valid_move?(input)
    input.to_i.between?(1, 9) && position(input) == " " 
  end

  # define update
  def update(input, player)
    @cells[input_index(input)] = player.token
  end
end
