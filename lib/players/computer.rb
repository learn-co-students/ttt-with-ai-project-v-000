module Players
  class Computer < Player
    
    def move(board)
      move = nil
      corner = [1, 3, 7, 9]
      if board.valid_move?("5")
        move = "5"
      elsif board.valid_move?(corner)
        move = corner.detect {|i| board.valid_move?(i).to_s}
      else
        move = Rand(1..9).to_s
      end
        binding.pry
    end
  end
end
