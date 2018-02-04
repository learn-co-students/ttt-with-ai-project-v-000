module Players
  class Human < Player

    def move(board)
      puts "Where would you like to play (1-9) #{self.token}?"
      input = gets.strip
      input
    end


  end
end
