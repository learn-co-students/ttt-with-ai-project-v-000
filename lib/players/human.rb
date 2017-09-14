module Players
  class Human < Player

    def initialize(token)
      super
    end

    def move(board)
      move = gets.chomp
    end

  end
end
