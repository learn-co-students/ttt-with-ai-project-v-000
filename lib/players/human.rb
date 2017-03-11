module Players

  attr_accessor :board
  class Human < Player
    # your code here
    def move(board)
      input = gets
    end
  end
end
