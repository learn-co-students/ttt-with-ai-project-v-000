module Players
  class Human < Player
    # your code here
    def move(board)
      puts "Where do you want to go?"
      answer = gets.chomp
      return answer
    end

  end
end
