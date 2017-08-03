require 'pry'

class Player
  
  attr_accessor :board, :game
  attr_reader :token

  def initialize(token ="X")
    @token = token
    @board = board
    @game = game
  end

end





