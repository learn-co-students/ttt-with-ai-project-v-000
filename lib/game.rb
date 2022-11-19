class Game
          WIN_COMBINATIONS =
          [[0,1,2],
          [3,4,5],
          [6,7,8],
          [0,3,6],
          [1,4,7],
          [2,5,8],
          [0,4,8],
          [6,4,2]]


          attr_accessor :board, :player_1, :player_2

    def initialize(player_1=Player::Human.new("X"),player_2=Player::Human.new("O"),board=Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      if board.turn_count % 2 == 0
        player_1
      else
        player_2
      end
    end

    def over?
      won? || draw?
    end

    def won?
      WIN_COMBINATIONS.each do |check|
      win_index_1 = check[0]
      win_index_2 = check[1]
      win_index_3 = check[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return true
      end
      end
        return false
    end

    def draw?
      !won? && board.full?
    end

    def winner
      if won?
       winning_combo = WIN_COMBINATIONS.detect{|x| board.cells[x[0]] == "X" && board.cells[x[1]] == "X" && board.cells[x[2]] == "X" || board.cells[x[0]] == "O" && board.cells[x[1]] == "O" && board.cells[x[2]] == "O"
      }
      board.cells[winning_combo[1]]
      end
    end

    def turn
      move_location = current_player.move(board)
      if !board.valid_move?(move_location)
      turn
      end
      board.update(move_location,current_player)
    end


    def play
      while !over?
        puts "Please enter where you want to put your symbol."
        turn
        board.display
      end
      if won?
      winner_letter  = winner
      puts "Congratulations #{winner_letter}!"
      elsif draw?
      puts "Cats Game!"
      end
    end

end
