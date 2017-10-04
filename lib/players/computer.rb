module Players
  class Computer < Player

    attr_accessor :game, :board, :player, :token

    def initialize(token = nil)
      @token = token
    end

    def move(board)
      index = self.strategy(board)
       if board.valid_move?(index)
         index.to_s
       else
         nil
       end
     end

     def strategy(board)
       if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
         5
       elsif board == [" ", " ", " ", " ", "X", " ", " ", " ", " "]
         1
       else rand(1..9)
     end
   end

 end
end
