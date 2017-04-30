class Players
  class Human < Player

    def move(board)
      puts "#{self.token}, please enter 1-9: "
      gets.strip
    end
  end
end
