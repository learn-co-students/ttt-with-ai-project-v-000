module Players
  class Human < Player
    def move(board)
      puts "Please enter your desired move: "
      gets.strip
    end
  end
end
