class Game
  attr_accessor :board, :player_1, :player_2
  #:board = provides access to the board
  #:game = provides access to player_1


      WIN_COMBINATIONS = [
        [0,1,2], #top_row_win
        [3,4,5], #middle_row_win
        [6,7,8], #bottom_row_win
        [0,3,6], #left_column_win
        [1,4,7], #center_column_win
        [2,5,8], #right_column_win
        [0,4,8], #left_diagonal_win
        [2,4,6] #right_diagonal_win
      ]
      #initialize accepts 2 players and a board, defaults to two human players, X and O
      #with an empty board
      def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
      end

      def current_player
          @board.turn_count % 2 == 0 ? player_1 : player_2 #if turn count number % 2 has a
            #zero remainder then it is going to be plahyer 1's turn if not it is going to be player 2's turn
      end

      def won?
        WIN_COMBINATIONS.detect do |win_combo|
          @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
          @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
          (@board.cells[win_combo[0]] == "X" || @board.cells[win_combo[0]] == "O")
        end
      end

      def draw?
        @board.full? && !won?
      end

      def over?
        won? || draw?
      end

      def winner
        if winning_combo = won? #if winning combo is true
          @winner = @board.cells[winning_combo.first] #Then winner is the char in the first cell
        end
      end

      def turn
        input = current_player.move(board)
        if !@board.valid_move?(input)
          turn
        else
          board.update(input, current_player)
          board.display
        end
      end

      def play
        until over?
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        else
          puts "Cat's Game!"

        end
      end

    end
