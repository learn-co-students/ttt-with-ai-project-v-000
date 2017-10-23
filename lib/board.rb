class Board
  attr_accessor :cells

  def initialize
    @cells = [" "]*9
  end

  def reset!
    @cells = [" "]*9
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i-1] # what is this doing? Why brackets and not setting @cells = user_input?
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    @cells.count {|val| val == "X" || val == "O"}
  end

  def taken?(position)
    @cells[position.to_i-1] == "X"|| @cells[position.to_i-1] == "O"
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9) # && !full? # Do I need a true and false here in order to make it work?
  end

  def update(input, player)
    @cells[input.to_i-1] = player.token
  end
end
