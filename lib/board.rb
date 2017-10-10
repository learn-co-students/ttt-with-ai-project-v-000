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
    integer = user_input.to_i
    @index = integer - 1
    @cells[@index]
  end

  def update(player)
    @cells[@index] = player.token
  end

  def full?
    @cells.all? do |slot|
      slot == "X" || slot =="O"
    end
  end

  def turn_count
    @cells.count{|slot| slot == "X" || slot =="O"}
  end

  def taken?(user_input)
    if position(user_input) == "O" || position(user_input) == "X"
      return true
    elsif position(user_input) == " " || position(user_input) == " " || position(user_input) == nil
      return false
    end
  end

  def valid_move?(user_input)
    if taken?(user_input)
      return false
    elsif @index < 0 || @index > 8 || @index == nil
      return false
    else
      return true
    end
  end
  
end
