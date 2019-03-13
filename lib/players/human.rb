module Players
  class Human < Player
    
    def move(board)
     puts "#{@token}, please enter a move (1-9):"
    input = gets.strip
    end
    
  end
end