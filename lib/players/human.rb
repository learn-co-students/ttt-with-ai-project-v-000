module Players
  class Human < Player

    def move(board)
      puts "Please input your position: "
      gets.strip
    end
  end
end
