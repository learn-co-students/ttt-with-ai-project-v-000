class Board
attr_accessor :cells

  def initialize
    reset!
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
    @cells[input]
  end

  def update(input, player)
    @cells[input] = player.token

  end

  def full?
    @cells.all? do |spaces|
    spaces == "X" || spaces == "O"
    end
  end

  def taken?(input)
    !(@cells[input].nil? || @cells[input] == " ")
  end

  def valid_move?(input)
    (input).between?(0,8) && !taken?(input)
  end

  def turn_count
     @cells.count{|token| token == "X" || token == "O"}
  end

end
