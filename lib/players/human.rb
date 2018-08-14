module Players
  class Human < Player
    # your code here
  end
end

class Players::Human < Player
    def move(board)
      #puts "Please enter 1-9:"
      gets.strip
    end

  end
