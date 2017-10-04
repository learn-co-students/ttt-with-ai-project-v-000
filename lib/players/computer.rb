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
       if board.cells == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
         5
       elsif board.cells == [" ", " ", " ", " ", "X", " ", " ", " ", " "]
         1
       elsif board.cells == ["X", " ", " ", " ", " ", " ", " ", " ", " "]
         5
       elsif (board.cells == [" ", "X", " ", " ", " ", " ", " ", " ", " "] ||
             board.cells == [" ", " ", " ", "X", " ", " ", " ", " ", " "] ||
             board.cells == [" ", " ", " ", " ", " ", "X", " ", " ", " "] ||
             board.cells == [" ", " ", " ", " ", " ", " ", " ", "X", " "])
             5
        elsif (board.cells == ["O", " ", " ", " ", "X", " ", " ", " ", " "] ||
              board.cells == [" ", " ", "O", " ", "X", " ", " ", " ", " "])
          2
        elsif (board.cells == [" ", " ", " ", " ", "X", " ", "O", " ", " "] ||
              board.cells == [" ", " ", " ", " ", "X", " ", " ", " ", "O"])
          8
        elsif board.cells == [" ", "O", " ", " ", "X", " ", " ", " ", " "]
          3
        elsif board.cells == [" ", " ", " ", "O", "X", " ", " ", " ", " "]
          7
        elsif board.cells == [" ", " ", " ", " ", "X", "O", " ", " ", " "]
          3
        elsif board.cells == [" ", " ", " ", " ", "X", " ", " ", "O", " "]
          7
       else rand(1..9)
     end
   end

 end
end

#doh!
