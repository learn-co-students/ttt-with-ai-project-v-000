module Players
  class Human < Player
    attr_accessor :token

    def move(board)
      puts "Please enter the box in which you would like to move"
      input = gets.chomp
    end

end
end
