module Players
  class Computer < Player
    attr_accessor :type, :taken

    def type
      @type = "Computer"
    end

    def move(board)
      index = nil
      puts "Please enter 1-9:"
      if (0..1).include?(board.turn_count)
        if board.valid_move?(5) #take middle spot first if open
          index = 5
          @taken << index
        else
          index = [1,3,7,9].sample #otherwise, opp has middle so take a corner
          # index = [2,4,6,8].sample #otherwise, opp has middle so take a side (testing wargames win percentage)
          @taken << index
        end
      elsif board.turn_count == 2 #on third move, prevent computer from wasting turn on blocked win combo
        opp = [*1..9].detect{|i| board.cells[i-1] != " " && board.cells[i-1] != self.token}
        @taken << opp
        waste = nil
        if [1,3,7,9].include?(opp)
          waste = 1 if opp == 9
          waste = 3 if opp == 7
          waste = 7 if opp == 3
          waste = 9 if opp == 1
        elsif [2,4,6,8].include?(opp)
          waste = 2 if opp == 8
          waste = 4 if opp == 6
          waste = 6 if opp == 4
          waste = 8 if opp == 2
        end
        @taken << waste
        index = ([*1..9]-@taken).sample
      else
        Game::WIN_COMBINATIONS.detect do |win_combo|
          if win_combo.find_all{|i| board.cells[i] == self.token}.size == 2 && win_combo.find_all{|i| board.cells[i] == " "}.size == 1 #if computer has chance to win, go for it
            test1 = win_combo.find_all{|i| board.cells[i] == self.token}.size == 2
            test2 = win_combo.find_all{|i| board.cells[i] == " "}.size == 1
            index = (win_combo.detect{|i| board.cells[i] == " "}) + 1
          elsif win_combo.find_all{|i| board.cells[i] != self.token && board.cells[i] != " "}.size == 2 && win_combo.find_all{|i| board.cells[i] == " "}.size == 1 #if no chance to win, check for opp chance to win and block
            test1 = win_combo.find_all{|i| board.cells[i] != self.token}.size == 2
            test2 = win_combo.find_all{|i| board.cells[i] == " "}.size == 1
            index = (win_combo.detect{|i| board.cells[i] == " "}) + 1
          end
        end
        index = rand(1..9).to_s if index == nil #worst case scenario, just go for any spot
      end
      puts "Computer player #{self.token} chooses position #{index}"
      index.to_s
    end
  end
end
