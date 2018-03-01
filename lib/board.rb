require 'pry'
class Board

  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    new_input = user_input.to_i
    new_input -= 1
    @cells[new_input]
  end

  def full?
    @cells.all? do |cell|
      if cell != " "
        true
      else
        false
      end #if statement
    end #each iteration
  end

  def turn_count
    count = @cells.count("O") + @cells.count("X")
    count
  end

  def taken?(position)
      new_position = position.to_i - 1
      @cells[new_position] == "X" || @cells[new_position] == "O" ? true : false
  end

  def valid_move?(user_input)
  new_input = user_input.to_i - 1
      if @cells[new_input] == " " && user_input.to_i >= 1 && user_input.to_i <= 9
        true
      else
        false
      end
end

  def update(token, player)
    new_token = token.to_i - 1
    @cells[new_token] = player.token
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end


end
