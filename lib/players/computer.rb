module Players
  class Computer < Player
    #attr_accessor :game

    def move(board)
      rand(1..9).to_s
      #optimal_moves = [5,1,7,3,9, @game.board.cells.index(" " + 1)]
      #if almost_won != nil
      #  win_or_block + 1
      #else
      #  optimal_moves.detect{ |move| @game.board.valid_move?(move)}
      #end

      #def other_token
      #  if self.token == @game.player_2.token
      #    @game.player_1.token
      #  else
      #    @game.player_2.token
      #  end
      #end

      #def almost_won
      #  @game.win_indexes.index{|index| index == ["#{self.token}","#{self.token}", " "] ||
      #  index == ["#{self.token}"," ","#{self.token}"] || index == [" ","#{self.token}","#{self.token}"]}
      #end

      #def win_or_block
      #  winning_cell = @game.win_indexes[almost_won].index(" ")
      #  Game.win_combinations[almost_won][winning_cell]
      #end
    end



  end
end
