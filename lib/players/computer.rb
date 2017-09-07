module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6],
    ]
    def move(board)
      if board.valid_move?("5")
      "5"
      elsif board.valid_move?("2") || board.valid_move?("4") || board.valid_move?("6") || board.valid_move?("8")
       ["2","4","6","8"].select {|n| board.valid_move?(n)}.sample
      elsif ["1","3","7","9"].select {|n| board.valid_move?(n)}.sample
      end
    end
  end
end
