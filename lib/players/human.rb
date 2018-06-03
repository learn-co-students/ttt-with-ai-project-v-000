module Players  #a module that holds the instance methods for the other types of players
  class Human < Player
    def move(board)
      puts "Select a position for your move: "
      move=gets.strip
      #board[move.to_i-1]=self.token  #maybe later...
    end





  end
end
