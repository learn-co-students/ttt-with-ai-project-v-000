module Players
  class Human < Player
    # your code here
    def move(board)
      puts "Enter your move: "
      input = gets.chomp
    end

  end
end
