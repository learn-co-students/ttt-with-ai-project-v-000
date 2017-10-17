module Players

  class Human < Player
    def move(board)
      puts "Place your token somewhere #{self.token}."
      input = gets.strip
    end
  end
end
