module Players
  class Computer < Player

    def move(board)
      puts "Computer select move 1 - 9"
      if !board.taken?(5)
        "5"
      else
       rand(1..9).to_s
      end

    end
  end

end
