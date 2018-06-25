require 'pry'

class Board

attr_accessor :cells

@cells = []

  def initialize
    reset!
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(user_input)
    index = input_to_index(user_input)
    @cells[index]
  end

  def full?
     !@cells.include?(" ")
  end

  def turn_count
    @cells.count("X") +  @cells.count("O")
  end

  def taken?(user_input)
      if position(user_input) == "X"
        return true
      elsif position(user_input) == "O"
        return true
      else position(user_input) == " "
        return false
      end
      false
    end

  def valid_move?(user_input)
    if user_input.between?("1","9") && !taken?(user_input)
       return true
     else user_input == "invalid"
       return false
     end
     false
   end

   def token(player_object)
     player_object = "X" || "O"

   end


   def update(user_input, player_object)
     index = input_to_index(user_input)
     valid_move?(user_input) == true
       @cells[index] = player_object.token
       display
     end
end
