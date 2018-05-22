
  class Player
    #inherits other classes of player < Human and < Computer. Has #token set on initialization. player subclass has move method


    attr_reader :token

    def initialize(token = "X")
      @token = token
    end

  
  end
