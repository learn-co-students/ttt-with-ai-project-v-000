class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  #def reset! 
  #   @cells = Array.new(9, " ")
  # end
  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
  @cells.count("X") + @cells.count("O")
  end

  def taken?(number)
    if @cells[number.to_i - 1] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
  cells = index.to_i
  cells.between?(1, 9) && !taken?(cells)
end

def update(input, player)
  @cells[input.to_i - 1] = player.token

end

end
