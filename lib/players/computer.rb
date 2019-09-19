module Players
  class Computer < Player
    #attr_accessor :game

    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"
      elsif board.turn_count >= 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      else
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          elsif combo.select{|i| !board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i+(1).to_s
          end
        end
      end 

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
