class Board
  attr_accessor :cells, :token

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n"
    puts "-----------\n"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n"
    puts "-----------\n"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n"
  end

  def position(x)
    user_input = x.to_i - 1
    return @cells[user_input]
  end

  def full?
    if @cells.include?(" ")
      return false
    else
      true
    end
  end

  def turn_count
    x_count = @cells.count("X")
    o_count = @cells.count("O")
    turn_total = x_count + o_count
    turn_total
  end

  def taken?(x)
      return false if [" ", "", nil].include?(position(x))
      return true if ["X", "O"].include?(position(x))
  end

  def valid_move?(x)
    user_input = x.to_i - 1
    if user_input.between?(0,8) && taken?(x) == false
      return true
    else
      return false
    end
   false
  end

  def update(x, player)
    user_input = x.to_i - 1
    @cells[user_input] = player.token
  end
end
