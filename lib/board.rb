# include & between return booleans
class Board
  attr_accessor :cells

  def reset!
    @cells = [' '] * 9
  end

  def initialize
    reset!
  end

  def possible_moves
    indices = []
    @cells.each_with_index do |token, i|
      indices << i if token == " "
    end
    indices
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
     i = pos.to_i - 1
    @cells[i]
  end

  def update(pos, user_obj)
    i = pos.to_i - 1
    @cells[i] = user_obj.token
  end

  def full?
    @cells.all? { |pos| pos == 'X' || pos == 'O' }
  end

  def turn_count
    @cells.count('X') + @cells.count('O')
  end

  def taken?(pos)
    i = pos.to_i - 1
    @cells[i] == " " ? false : true
  end

  def valid_move?(pos)
    input = pos.to_i
    !taken?(pos) && (1..9).include?(input)
  end
end
