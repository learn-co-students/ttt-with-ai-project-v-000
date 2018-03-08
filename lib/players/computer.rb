module Players
  class Computer < Player
    def move(board)
      puts "The computer is thinking..."
      sleep(2)
      @input = rand(1...9).to_s
    end
  end
end
