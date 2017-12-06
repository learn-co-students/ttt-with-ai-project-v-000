module Players
  class Human < Player
    attr_accessor :board, :player_1, :player_2
    def move(board)
      input = gets.strip
      input
    end
  end
end
