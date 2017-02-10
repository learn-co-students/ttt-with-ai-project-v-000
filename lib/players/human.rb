module Players
  class Human < Player
    def move(board)
      # binding.pry
      puts "It's your move #{self.token}"
      board.display
      gets.strip
    end

  end# class Human
end# module Players
