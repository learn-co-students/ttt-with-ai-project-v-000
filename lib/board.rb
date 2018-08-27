class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    @cells.replace(Array.new(9, " "))
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def user_input_to_index(user_input)
    index = user_input.to_i - 1
    return index
  end

  def position(user_input)
    return @cells[user_input_to_index(user_input)]
  end

  def full?
    @cells.none? { |cell| cell == " "}
  end

  def turn_count
    counter = @cells.count("X") + @cells.count("O")
    return counter
  end

  def taken?(user_input)
    index = user_input_to_index(user_input)
    if @cells[index] == "X" || @cells[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(user_input)
    if user_input.to_i.between?(1, 9) && !taken?(user_input.to_i)
      true
    else
      false
    end
  end

  def update(user_input, player)
    @cells[user_input_to_index(user_input)] = player.token
  end
end