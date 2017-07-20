class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    initialize
  end

  def usable_index(user_input)
    user_input.to_i - 1
  end

  def position(user_input)
    spot_taken = usable_index(user_input)
    cells[spot_taken]
  end

  def full?
    cells.all? {|spot|
      spot == 'X' || spot == 'O'}
  end

  def turn_count
    cells.count {|spot|
      spot == 'X' || spot == 'O'}
  end

  def taken?(user_input)
    spot = usable_index(user_input)
    cells[spot].include?('X') || cells[spot].include?('O')
  end

  def valid_move?(user_input)
    ((user_input.to_i == 1..9) && !taken?(user_input)) ? true : false
  end

  def update(user_input, player)
    cells[usable_index(user_input)] = player.token
  end

end
