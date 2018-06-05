class Players
  class Human < Player
    attr_accessor :board

    def move(board)
      puts "Enter your move."
      gets.strip
    end
  end

end
