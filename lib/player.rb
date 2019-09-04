require 'pry'

class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(position)
    # asks the user for input and returns it
    #takes in the argument of an array (board) and doesn't use it.
    user_input = gets.strip
    user_input 
  end

end
