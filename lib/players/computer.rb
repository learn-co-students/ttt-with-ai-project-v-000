module Players

  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    def move(board)
      puts "#{self.name} goes"
      if board.get_valid_moves.include?(5)
        @mymoves << 5
      elsif board.turn_count == 2
        @mymoves << [1,3,7,9].detect{|e| board.valid_move?(e)}
      elsif board.turn_count == 1
        @mymoves << [1,3,7,9].sample
      elsif trap?(board) && board.turn_count == 3
        board.cells[4] == @token ?  @mymoves << [2,4,6,8].sample : @mymoves << [1,3,7,9].detect{|e| board.valid_move?(e)}
      else
        stall_win(board)
      end
      @mymoves.last
    end

    def opponent
      @token == "X" ? "O" : "X"
    end

    def trap?(board)
      [1,5,9].all?{|e| !board.valid_move?(e)} || [3,5,7].all?{|e| !board.valid_move?(e)}
    end

    def stall_win(board)
      move = nil
      win_move = []
      block_move = []
      WIN_COMBINATIONS.each do |combo|
        result = []
        combo.each { |j| result << board.cells[j] }
        win_move << combo if result.count(@token) == 2
        block_move << combo if result.count(opponent) == 2
      end
      if win_move.count > 0 && win_move.flatten.any?{|a| board.valid_move?((a+1)) }
         @mymoves << win_move.flatten.select{|a| board.valid_move?((a+1)) }.sample + 1
      elsif block_move.count > 0 && block_move.flatten.any?{|a| board.valid_move?((a+1)) }
         @mymoves << block_move.flatten.detect {|a| board.valid_move?((a+1)) } + 1
      else
         @mymoves << board.get_valid_moves.sample
      end
    end
  end
end
