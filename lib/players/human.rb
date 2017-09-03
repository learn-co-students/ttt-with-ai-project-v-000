module Players
  class Human < Player
    # your code here
    def move(input)
    #  @input = input
      puts "Question"
      answer = gets.chomp
      return answer
    end

  end
end
