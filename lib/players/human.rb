module Players
  class Human < Player
    attr_accessor :player_1, :player_2, :board

    def move(board)
      puts "Choose 1-9"
      gets.chomp
    end
  end
end
