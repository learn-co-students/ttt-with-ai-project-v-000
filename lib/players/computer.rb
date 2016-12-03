module Players
  class Computer < Player
    def move(num)
      if self.comp_board[4] == " "
        5
      else
        rand(9).to_s
      end
    end
  end
end
