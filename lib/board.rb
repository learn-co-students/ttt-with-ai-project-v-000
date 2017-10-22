class Board

  attr_accessor :cells

  def initialize(cells = nil)
    self.reset!
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
    # takes in user input and returns the value of the board cell
    @cells[input.to_i - 1]
  end

  def full?
    # true for full board, false if game in progress
    !(@cells.include?(nil || " "))
  end

  def turn_count
    # amount of turns
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
    # true if X or O, false if not
    position(input) != " "
  end

  def valid_move?(input)
    # true if 1-9 and not taken
    !(taken?(input)) && input.to_i.between?(1,9)
  end

  def update(input, player)
    # updates board cells with input
    if valid_move?(input)
      @cells[input.to_i - 1] = player.token
    end

  end

end
