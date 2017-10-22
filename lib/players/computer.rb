module Players
  class Computer < Player

    def move(board)
      # helper methods: offensive(board), defensive(board), middle?(board),  corners?(board), sides?(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.sample
    end

    ## create helper methods ##
    def middle?(board)
        if board[4] = " " then board[4] = self.token 
    end
    
    def corners?(board) 
      if board[0] == " " then board[0] == self.token|| board[2] == " " then board[2] == self.token 
        || board[6] == " " then board[6] == self.token || board[8] == " " then board[8] == self.token
      end 
    end 
end
