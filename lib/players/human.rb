module Players
  class Human < Player

    def move(board = nil)
      puts "Please pick a spot 1-9"
      user_input = gets.chomp
    end

end
end
