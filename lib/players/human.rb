module Players
  class Human < Player
    attr_accessor :board
     def move(board)
      board = gets.chomp
    end
   end
end