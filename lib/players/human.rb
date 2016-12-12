class Player::Human < Player

    
    def move(board)
        puts "Which position would you like to move to?"
        gets.strip
    end
end