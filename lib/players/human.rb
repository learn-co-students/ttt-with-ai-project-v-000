class Player::Human < Player

    def move(board)
      board.display
      puts "Where would you like to move?"
      input = gets.chomp
    end 
    
end