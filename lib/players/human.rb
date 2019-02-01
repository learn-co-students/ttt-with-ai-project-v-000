module Players
  class Human < Player

    def move(board)
      puts "please enter the position you want to move"
      gets.strip
    end

  end
end
