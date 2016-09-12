module Players
  class Computer < Player
    def move(board)
      (1..9).each_with_object("") do |x, obj|
        if board.valid_move?(x)
          obj = x.to_s
          return obj
        end
      end
    end
  end
end

