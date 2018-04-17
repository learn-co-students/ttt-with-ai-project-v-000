module Players
  class Human < Player

    def move (board)
      puts "Next Move?  (Enter 1..9)"
      # ideally, we would like to change for "position" to index and integer here,
      # but tests (and board interface) require returning position (1..9) as string
      gets.strip
    end
  end

end
