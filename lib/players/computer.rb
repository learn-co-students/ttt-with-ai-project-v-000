module Players
  class Computer < Player
    def move(board)
      puts "#{@token} computer's move:"
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.shuffle.each do |move|
        return move if board.valid_move?(move)
      end
    end
  end
end
