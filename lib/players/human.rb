module Players
   class Human < Player

     def move(board)
       puts "Player #{self.token}, it's your turn. Please enter a move using 1-9:"
       gets.chomp
     end
  end
end
