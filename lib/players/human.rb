module Players
  class Human < Player
    attr_accessor :token

    def move(board)
      board.display
      puts "Please enter the box in which you would like to move"
      input = gets.chomp
      input = input.to_i - 1
    end

end
end
