module Players
  class Computer < Player
    def move(board)
      puts "The computer is thinking about it's next move..."
      sleep 2
      (1..9).each_with_object("") do |x, obj|
        if board.valid_move?(x)
          obj = x.to_s
          return obj
        end
      end
    end
  end
end

