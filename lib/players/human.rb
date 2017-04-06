module Players
  class Human < Player
    def move(board)
      puts "Your move!"
      gets.chomp
    end
  end
end
