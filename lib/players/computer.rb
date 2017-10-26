module Players
  class Computer < Player

    def move(board=nil)
      pos = rand(1..9).to_s
    end
  end
end
