module Players
  class Human < Player
    def move(board)
      input = ""

      until (1..9).include?(input.to_i) do
        puts "Where would you like to move?"
        input = gets.strip
      end

      input
    end
  end
end
