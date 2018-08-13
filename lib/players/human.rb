module Players
  class Human < Player

    def move(board)
      puts "Please enter 1-9"
      u_i = gets.strip
      u_i
    end
  end
end
