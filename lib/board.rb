class Board

  attr_accessor :cells

  def initialize()
    reset!
  end

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
    index = (user_input.to_i) - 1
    return "#{@cells[index]}"
  end

  def full?
    @cells.all? do |cell|
      cell != " "
    end
  end

  def turn_count
    @cells.count do |cell|
      cell == "X" || cell == "O"
    end
  end

  def taken?(user_input)
    index = (user_input.to_i) - 1
    if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(user_input)
    if taken?(user_input)
      false
    elsif user_input.to_i > 9 || user_input.to_i < 1
      false
    else
      true
    end
  end

  def update(user_input, player)
    index = (user_input.to_i) - 1
    @cells[index] = player.token
  end

end
