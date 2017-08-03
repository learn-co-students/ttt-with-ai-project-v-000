module Players

  class Computer < Player

    def move(board)
      if board.valid_move?("5")
        "5"
      elsif about_to_win?(board) != nil
        "#{about_to_win?(board) + 1}"
      elsif opponent_to_win?(board) != nil
        "#{opponent_to_win?(board) + 1}"
      elsif try_to_win?(board) != nil
        "#{try_to_win?(board) + 1}"
      else
        "#{(0..8).detect {|spot| spot.even? && board.valid_move?(spot)} + 1}"
      end

    end

    def about_to_win?(board)
      winner = nil
      Game::WIN_COMBINATIONS.detect do |combo|
        xoxocombo = combo.map {|i| board.cells[i]}
        count = 0
        xoxocombo.each {|cell| count += 1 if cell == @token}
        winner = combo.detect {|index| board.valid_move?(index)} if count == 2
        break if winner != nil
      end
      winner
    end

    def opponent_to_win?(board)
      winner = nil
      @token == "O" ? opponent_token = "X" : opponent_token = "O"
      Game::WIN_COMBINATIONS.detect do |combo|
        xoxocombo = combo.map {|i| board.cells[i]}
        count = 0
        xoxocombo.each {|cell| count += 1 if cell == opponent_token}
        winner = combo.detect {|index| board.valid_move?(index)} if count == 2
        break if winner != nil
      end
      winner
    end

    def try_to_win?(board)
      winner = nil
      Game::WIN_COMBINATIONS.detect do |combo|
        xoxocombo = combo.map {|i| board.cells[i]}
        count = 0
        xoxocombo.each {|cell| count += 1 if cell == @token}
        winner = combo.detect {|index| board.valid_move?(index)} if count == 1
        break if winner != nil
      end
      winner
    end

  end
end
