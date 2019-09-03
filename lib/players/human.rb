module Players
  class Human < Player

    def move(board)
      puts "Please select a postion 1-9"
      gets.strip
    end
  end
end
