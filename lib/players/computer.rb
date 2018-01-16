module Players
  class Computer < Player
    attr_accessor :type

    def type
      @type = "Computer"
    end

    def move(board)
      index = nil
      puts "Please enter 1-9:"
      if [0,1].include?(board.turn_count)
        if board.valid_move?(5)
          index = 5
        else
          index = [1,3,7,9].sample
        end
      elsif [2,3].include?(board.turn_count)
        if board.position(5) == self.token
          index = [2,4,6,8].sample
        elsif board.position(5) != " "
          opp = [*1..4,*6..9].detect{|index|board.position(index) != self.token && board.position(index) != " "}
          # binding.pry
          if [1,3,7,9].include?(opp)
            index = 1 if opp == 9
            index = 3 if opp == 7
            index = 7 if opp == 3
            index = 9 if opp == 1
          elsif [2,4,6,8].include?(opp)
            index = 2 if opp == 8
            index = 4 if opp == 6
            index = 6 if opp == 4
            index = 8 if opp == 2
          end
        else #go to opposite corner of current spot
          corner = [1,3,7,9].detect{|index|board.position(index) == self.token}
          if corner == 1 || corner == 9
            index = 9 if corner == 1
            index = 1 if corner == 9
          elsif corner == 3 || corner == 7
            index = 7 if corner == 3
            index = 3 if corner == 7
          end
        end
      else
        index = rand(1..9).to_s
      end
      # binding.pry
      puts "Computer player #{self.token} chooses position #{index}"
      index
    end
  end
end
