module Players

  attr_accessor :board
  class Human < Player
    # your code here
    def move(board)
      gets
    end
  end
end
