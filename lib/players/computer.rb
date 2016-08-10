require 'pry'
module Players
  class Computer < Player
    def move(bd)
      empty = bd.cells.first(" ")
      if empty == 0
        empty+= 1
      end
    end

  end
end
