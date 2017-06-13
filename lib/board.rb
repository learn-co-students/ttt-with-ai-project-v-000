class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    #@cells = Array.new(9, " ")
    initialize
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    indexInput = user_input.to_i
    @cells[indexInput - 1]
  end

  def full?
    @cells.all? {|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(user_input)
    indexInput = user_input.to_i
    @cells[indexInput - 1] == "X" || @cells[indexInput - 1] == "O"
  end

  def valid_move?(user_input)
    indexMove = user_input.to_i
    #indexMove - 1
    indexMove.between?(1, 9) && !taken?(user_input)
  end

  def update(user_input, char = "X")
    indexInput = user_input.to_i - 1
      @cells[indexInput] = char.token
  end
end
