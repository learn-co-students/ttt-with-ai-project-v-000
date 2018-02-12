
class Game

  attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Diagonal upper-left lower-right
    [2, 4, 6]  # Diagonal upper-right lower-left
    ]

    def current_player
      @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def over?
      won? || draw? || board.full?
    end

    def won?
      WIN_COMBINATIONS.detect do |win_combo|
        # board.taken?(win_combo[0]) &&
        board.cells[win_combo[0]] == board.cells[win_combo[1]] &&
        board.cells[win_combo[0]] == board.cells[win_combo[2]] &&
        board.taken?(win_combo[0] + 1)
      end
    end

    def draw?
      board.full? && !won?
    end

    def winner
      if game_pos = won?
        @winner = board.cells[game_pos[0]]
      end
    end

    def turn
      player = current_player
      sleep(1)
      puts "This is what the board currently looks like:"
      board.display
      puts "Where would you like to go?"
      current_move = player.move(board)
      if !(board.valid_move?(current_move))
        puts "You entered an invalid number. Please try again."
        turn
      else
        puts "Turn: #{board.turn_count+1}"
        board.update(current_move, player)
        puts "#{player.token} chose position #{current_move}"
      end
    end

    def play
      until over?
        turn
      end
      if won?
        board.display
        puts "Congratulations #{winner}!"
      elsif draw?
        board.display
        puts "Cat's Game!"
      end
    end

    def start

    end

end
