module Players
  class Human < Player
    attr_accessor :player_1, :player_2, :board

    def move(input)
      input = gets.strip
    end
  end
end
