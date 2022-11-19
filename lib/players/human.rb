module Players
  class Human < Player
    def initialize(token)
      super
    end

    def move(board)
      print "\n#{@token}, Enter your move [1-9]: "
      gets.strip
    end
  end
end
