class Board
  attr_accessor :cells

  def initialize
    reset!

  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    c = Array.new(9, " ")

    for i in 0..9
      c[i] = @cells[i] == " " ? "#{i+1}" : @cells[i]
    end

    puts " #{c[0]} | #{c[1]} | #{c[2]} "
    puts "-----------"
    puts " #{c[3]} | #{c[4]} | #{c[5]} "
    puts "-----------"
    puts " #{c[6]} | #{c[7]} | #{c[8]} "
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    @cells.none? {|cell| cell == " "}
  end

  def turn_count
    @cells.count {|cell| cell != " "}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token if valid_move?(input)
  end
end
