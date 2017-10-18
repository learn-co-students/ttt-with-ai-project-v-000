class Game

  attr_accessor :board, :player_1, :player_2


  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

    def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def winner
      !won? ? nil : board.cells[won?.first]
    end

    def over?
        draw? || won?
    end

    def won?
        win_combo = nil
        WIN_COMBINATIONS.each do |combo|
          p1 = board.cells[combo[0]]
          p2 = board.cells[combo[1]]
          p3 = board.cells[combo[2]]

        if (p1 == p2 && p2 == p3) && (p1 == "X" || p1 == "O")
          win_combo = combo
          break
        end
      end
        win_combo
    end

    def draw?
      board.full? && !won?
    end

    def turn
      cell = current_player.move(board)
     if board.valid_move?(cell)
       board.update(cell, current_player)
     else
       puts 'Invalid turn, Try Again!'
       turn
     end
   end

   def play
      until over?
        puts ""
        @board.display
        puts ""
        turn
      end

      if won?
        puts "Congratulations #{winner}!"
      else draw?
        puts "Cat's Game!"
      end
   end
end
