class Board

  WIN_COMBINATIONS =
  [ [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2] ]

  attr_accessor :cells, :choice

  def initialize(cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @cells = cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]  
  end

  def converter(player_input)
      player_input.to_i - 1
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.select {|cell| cell == " "}.size
  end

  def taken?(player_input)
    # cells[converter(player_input)] != " "
    !(position(player_input) == " ")
  end

  def valid_move?(player_input)
    player_input.to_i >= 1 && player_input.to_i <= 9 && !taken?(player_input)
  end

  def update(input, player)
    cells[converter(input)] = player.token
  end

  def move(input, token)
    cells[input] = token
  end

  def clone
    Board.new(self.cells.clone)
  end


end
