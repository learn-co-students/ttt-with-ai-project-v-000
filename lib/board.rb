
class Board

  attr_accessor :cells
  attr_reader :token

  def initialize
    @cells = Array.new(9) {" "}
  end

  def reset!
    @cells = Array.new(9) {" "}
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position (input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? {|el| el == "X" || el == "O" }
  end

  def turn_count
    count = 0
    @cells.each do |play|
      count += 1 if play == "X" || play =="O"
    end
    count
  end

  def taken? (position)
    @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
  end

  def valid_move? (input)
    input = input.to_i
    !taken?(input) && (1...10).include?(input)
  end

  def update (position, player)
    @cells[position.to_i - 1] = player.token
  end

end
