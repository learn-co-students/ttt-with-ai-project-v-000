require_relative "../player.rb"

module Players
  class Computer < Player
    @@corner_move = [1, 3, 7, 9].sample.to_s
    @@edge_move = [2, 4, 6, 8].sample.to_s
    @@random_move = (1..9).to_a.sample.to_s

    # check for move validity in this class to add additional computer intelligence
    # possibly initialize game in player class as well
    # include game as a move argument so you know which token you are
    # build moves if X or if O

    def move(board, game = Game.game)
      move = nil
      if board.turn_count == 0 || board.turn_count == 1
        first_move(board, game)
        move
      elsif board.turn_count == 2 || board.turn_count == 3
        block_win(board, game)
        secure_win(board, game)
        second_move(board, game)
        move
      elsif board.turn_count == 4
        block_win(board, game)
        secure_win(board, game)
        third_move(board, game)
        move
      else
        until board.valid_move?(move)
          block_win(board, game)
          secure_win(board, game)
          move = @@random_move
        end
        move
      end
      move
      
      # binding.pry
    end

    # method to block other player's possible win
    def block_win(board, game)
      Game::WIN_COMBINATIONS.find do |combo|
        poss_win = []
        combo.each {|i| poss_win << board.cells[i]}
        if poss_win.count("O") == 2 && poss_win.count(" ") == 1 && game.current_player.token == "X"
          move = poss_win.find_index(" ") + 1
        elsif poss_win.count("X") == 2 && poss_win.count(" ") == 1 && game.current_player.token == "O"
          move = poss_win.find_index(" ") + 1
        end
        move
      end
      move
    end

    # method to execute game-winning move
    def secure_win(board, game)
      Game::WIN_COMBINATIONS.find do |combo|
        poss_win = []
        combo.each {|i| poss_win << board.cells[i]}
        if poss_win.count("X") == 2 && poss_win.count(" ") == 1 && game.current_player.token == "X"
          move = poss_win.find_index(" ") + 1
        elsif poss_win.count("O") == 2 && poss_win.count(" ") == 1 && game.current_player.token == "O"
          move = poss_win.find_index(" ") + 1
        end
        move
      end
      move
    end

    # move methods by turn
    def first_move(board, game)
      if game.current_player.token == "X"
        move = "1"
      elsif game.current_player.token == "O"
        board.cells[4] == "X" ? move = "1" : move = "5"
      end
      move
      # binding.pry
    end

    def second_move(board, game)
      if game.current_player.token == "X"
        if board.cells[1] == "O"
          move = "7"
        elsif board.cells[2] == "O"
          move = "4"
        elsif board.cells[3] == "O" || board.cells[8] == "O"
          move = "3"
        elsif board.cells[5] == "O" || board.cells[7] == "O"
          move = "5"
        elsif board.cells[6] == "O"
          move = "2"
        end
        move
      elsif game.current_player.token == "O"
        if board.cells[4] == "O" || [2, 4, 6, 8].find {|i| board.cells[i] == "O"}
          move = @@corner_move
        elsif [1, 3, 7, 9].find {|i| board.cells[i] == "O"}
          move = @@edge_move
        end
        move
      end
      move
    end

    def third_move(board, game)
      if [1, 2, 3, 6].find {|i| board.cells[i] == "X"}
        move = "5"
      elsif board.cells[4] == "X" && board.cells[5] == "O"
        move = "3"
      elsif board.cells[4] == "X" && board.cells[7] == "O"
        move = "7"
      end
      move
    end

    
    # # if you're token X
    # def first_move(board, game)
    #   move = "1"
    # end

    # def second_move(board, game)
    #   if board.cells[1] == "O"
    #     move = "7"
    #   elsif board.cells[2] == "O"
    #     move = "4"
    #   elsif board.cells[3] == "O" || board.cells[8] == "O"
    #     move = "3"
    #   elsif board.cells[5] == "O" || board.cells[7] == "O"
    #     move = "5"
    #   elsif board.cells[6] == "O"
    #     move = "2"
    #   end
    #   move
    # end

    # def third_move(board, game)
    #   # "O" center move scenario is handled by win methods
    #   if [1, 2, 3, 6].find {|i| board.cells[i] == "X"}
    #     move = "5"
    #   elsif board.cells[4] == "X" && board.cells[5] == "O"
    #     move = "3"
    #   elsif board.cells[4] == "X" && board.cells[7] == "O"
    #     move = "7"
    #   end
    #   move
    # end

    # # if you're token O
    # def first_move(board, game)
    #   board.cells[4] == "X" ? move = "1" : move = "5"
    # end

    # def second_move(board, game)
    #   if board.cells[4] == "O" || [2, 4, 6, 8].find {|i| board.cells[i] == "O"}
    #     move = @@corner_move
    #   elsif [1, 3, 7, 9].find {|i| board.cells[i] == "O"}
    #     move = @@edge_move
    #   end
    # end
    
  end
end