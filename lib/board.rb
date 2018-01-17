class Board
  attr_accessor :cells, :player, :token



  def initialize(board = nil)
    @cells = Array.new(9, " ")
    @board = board || @cells
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i-1
  end

  def position(input)
    index = input_to_index(input)
    @cells[index]
  end

  def full?
    @cells.any? {|i| i ==" "} ? false : true
  end

  def turn_count
    @cells.count {|i| i == "X" || i == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O" ? true : false
  end

  def valid_move?(input)
    index = input.to_i
    !taken?(index) && index.between?(1, 9) ? true : false
  end

  def update(input, player)
    @cells[input_to_index(input)] = "#{player.token}"
  end

end
