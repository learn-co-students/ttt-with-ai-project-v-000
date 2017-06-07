class Players
  class Human < Player
    attr_reader :token
    def initialize(token)
      @token = token
    end

    def move(board)
       move = gets.strip
       move = move.to_i
       if board.valid_move?(move)
         board.cells[move - 1] = @token
         move
       else
         nil
       end
    end
  end
end
