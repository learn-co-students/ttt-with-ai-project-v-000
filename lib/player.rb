require 'pry'
class Player

  attr_reader :token

  def initialize(token)
    token == "X" || token == "O" ? @token = token : raise("Must select X or O")
  end

end