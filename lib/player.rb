require_relative './game_status.rb'
class Player

  attr_accessor :game, :depth
  attr_reader :token

  include GameStatus

  def initialize(token)
    @token = token
    @depth = 0
  end




end #Ends Player class