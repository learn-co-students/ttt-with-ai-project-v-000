begin
module Players
  
  class Human < Player

    def move(board)
      
      puts "Player #{self.token}, please choose a number between 1-9 for your move."
      player_move = gets.strip
      
      if player_move.to_i.between?(1,9)
        player_move
      else
        puts "Invalid Entry for Board Move, please try again."
        move(board)
      end 
    end
  end
  
end
end
