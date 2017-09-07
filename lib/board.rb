class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def position(player_input)
    cells[player_input.to_i - 1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.select {|cell| cell == " "}.size
  end

  def taken?(player_input)
    cells[player_input.to_i - 1] != " "
  end

  def valid_move?(player_input)
    player_input.to_i >= 1 && player_input.to_i <= 9 && !taken?(player_input)
  end
# don't get why this didn't work.
  # def update(player_input, player)
  #   binding.pry
  #   self.position(player_input) == player.token
  # end

  def update(input, player)
  	cells[input.to_i - 1] = player.token
  end


end
