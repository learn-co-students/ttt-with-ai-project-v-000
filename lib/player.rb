class Player

  attr_accessor :player
  attr_reader :token

    def initialize(token)
      @player = player
      @token = token
    end

    def token
      @token
    end


  #every player subclass will implement a #move method that represents how the type of player makes a move
end
