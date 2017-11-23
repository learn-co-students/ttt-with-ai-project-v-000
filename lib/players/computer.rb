module Players
  class Computer<Player

    attr_accessor :scores, :player, :last_move

    @player

    def move(board)
      if board.turn_count==0
        index=board.possible_moves[rand(board.possible_moves.count-1)]
        puts "First move: #{index}"
        return index.to_s
      else
        index=board.possible_moves[rand(board.possible_moves.count-1)]
        if board.turn_count%2==0
          @player="X"
        else
          @player="O"
        end
        @scores=[]
        best_move=minimax1(board)
        index=best_move unless best_move==nil
        puts "Please enter 1-9: #{index}"
        return index.to_s #if board.valid_move?(index)
      end
    end


  def minimax1(board)
    temp_board=[]
    board.cells.each {|c| temp_board<<c}
    moves={}
    board.possible_moves.permutation.each do |move|
      new_board=temp_board
      #puts new_board
      #puts board.cells
      current=@player
      for i in 0..move.size
        new_board[move[i].to_i-1]=current
        if current=="X"
          current="O"
        else
          current="X"
        end
      end
      temp_game=Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new(new_board))
      #temp_game.play
      score=temp_game.score
      moves[move]=score
    end
    #puts "Moves: #{moves.values}"
    if @player=="X"
      best_move=moves.sort_by{|key, value| value}.last[0][0]
      score=moves.sort_by{|key, value| value}.last
    else
      best_move=moves.sort_by{|key, value| value}.first[0][0]
      score=moves.sort_by{|key, value| value}.first
    end
    puts "Best move: #{best_move} move score:#{score[1]} player:#{@player}"
    best_move

  end
end

end
