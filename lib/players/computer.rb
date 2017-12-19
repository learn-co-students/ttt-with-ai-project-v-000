module Players
  class Computer < Player
    def move(board)
      puts "Computer Player #{self.token} is playing."
      if board.cells[4] == " "
        "5"
      else
        prng = Random.new
        prng.rand(1..9).to_s
      end
    end
  end
end
