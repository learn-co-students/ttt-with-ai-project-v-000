module Players
  class Human < Player
    def move(board)
      puts "Please enter your move (choose between 1-9 going from left to right on the board)"
      gets.chomp
    end
  end
end