class Board
  attr_accessor :cells

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

  def initialize
    self.reset!
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
    cells[(input.to_i)-1]
  end

  def full?
    cells.all? {|token| token != " "}
  end

  def turn_count
    cells.count { |x| x != " "}
  end
  
  def taken?(input)
    !(position(input) == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    if valid_move?(input)
      cells[(input.to_i - 1)] = player.token
    else
      nil
    end
  end

  def has_combo
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |position| cells[position] == "X" || cells[position] == "O" }
    end
  end

  def winner
    has_combo
  end

  def available_spaces
    arr = []
    cells.each_with_index { |cell, index| arr << index if cell == " "}
    arr
  end

  def place_token(space, token)
    # binding.pry
    cells[space] = token
  end
  
end

# board = Board.new
# p board.available_spaces