class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    @cells.all? {|i| i == "X" || i == "O"}
  end

  def turn_count
    count = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end

  def taken?(input)
    position(input) != " " ? true : false
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    if valid_move?(input)
      @cells[input.to_i - 1] = player.token
    end
  end

end
