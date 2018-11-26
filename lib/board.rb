require 'pry'

class Board
  attr_accessor :cells , :token

  def initialize
    @cells = [" ", " ", " "," ", " ", " "," ", " ", " "]
  end
# it has a property, cells, that stores the data of the state of the board in an array.
# The #reset! method can reset the state of the
# cells to what a board should look like at the start of a game, an array with 9 " " elements.
   def cells
     @cells
   end

  def reset!

    @cells = [" ", " ", " "," ", " ", " "," ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    index = user_input.to_i - 1
    @cells[index]
    #binding.pry
  end


  def full?
    answer = true
    @cells.each do |token|
      if token != "X" && token != "O"
        answer = false
      end
    end
  	answer
      # other solution - board.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
   @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(user_input)
      position(user_input) != " "
      #binding.pry
  end

  def valid_move?(user_input) # input is "1"
    # binding.pry

    #value_of_position = position(user_input) # "X"
    #binding.pry
    !taken?(user_input) && user_input.to_i.between?(1,9)

    # if value_of_position == "X" || value_of_position == "O" || value_of_position == nil || value_of_position == "invalid"
    #   return false
    # else
    #   return true
    # end
  end


  # def update(user_input, player)
  #   @cells[user_input.to_i] # @cells - the board in array form
  #   @cells[user_input.to_i] = player.token # getting the player's token and put that into the specific
  #   # spot on the board.
  #   @cells
  # end
  def update(user_input, player)

    @cells[user_input.to_i - 1] = player.token # getting the player's token and put that into the specific

  end

end
