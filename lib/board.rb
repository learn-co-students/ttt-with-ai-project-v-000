class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
   index = input.to_i - 1
   cells[index]
  end

  def full?
    cells.all? {|token| token == "X" || token == "O" }
    #true >> all cells are filled with "X" or "O"   False >> not all cells are filled
  end

  def turn_count
    cells.count {|token| token == "X" || token == "O"}
    # counting how many cells have tokens in them
  end

  def taken?(input)
    !(position(input) == "" || position(input) == " ")
    #input is string from user - convert to index (-1) and check cells
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
    # position(input) # = " " and input = "1" So have to convert 1 to integer?
    # input.to_i - 1 which is the index of " " in cells
  end

end
