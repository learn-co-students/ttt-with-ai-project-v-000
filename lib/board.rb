class Board
  attr_accessor :cells

	def initialize
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
	end

  def reset!
    @cells.clear
    initialize
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    match = input.to_i-1
    @cells[match]
  end

  def full?
    !@cells[0..8].any? {|i| i == "" || i == " "}
  end

  def turn_count
    @cells.count {|i| i == "X" || i == "O"}
  end

  def taken?(input)
    cell = input.to_i-1
    @cells[cell] != "" && @cells[cell] != " "
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, user)
    cell = input.to_i-1
    @cells[cell] = user.token
  end
end
