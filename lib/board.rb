class Board

  attr_accessor :cells, :cells

  def initialize (cells = nil)
    @cells = cells || Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
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
    @cells [position]
  end

  def full?
    @cells.all? {|x| x == "O" || x == "X"}
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

  def taken?(input)
    position = input.to_i - 1
    @cells[position] == "X" || @cells[position] == "O"
  end

  def valid_move?(input)
    position = input.to_i - 1
    !taken?(input) && position >= 0 && position <= 8
  end

  def update(input, player)
    position = input.to_i - 1
    @cells[position] = player.token
  end

end
