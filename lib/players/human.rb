class Players::Human < Player
    def move(board)
      puts "Select a cell (1-9)"
      user_input= gets.chomp
      user_input
    end
  end
