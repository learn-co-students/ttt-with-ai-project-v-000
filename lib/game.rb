class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
  ]

    def board
      @board
    end

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board= Board.new)
      self.player_1 = player_1
      self.player_2 = player_2
      self.board = board
    end

    def current_player
      board.turn_count%2 == 0 ? player_1 : player_2
    end

    def full?
      self.board.cells.any? {|i| i == " "} ? false : true
   end

    def draw?
      full? && !won?
    end

    def over?
      draw? || won?
    end

    def won?
      WIN_COMBINATIONS.any? do |combo|
        if board.cells[combo[0]] == player_1.token &&
            board.cells[combo[1]] == player_1.token &&
            board.cells[combo[2]] == player_1.token ||
            board.cells[combo[0]] == player_2.token &&
            board.cells[combo[1]] == player_2.token &&
            board.cells[combo[2]] == player_2.token
          return combo
        end
      end
    end

    def winner
      if (won?)
        board.cells[won?.first]
      else
        nil
      end
    end

    def turn
      puts "Please pick a position 1-9"
      move = current_player.move(board)
      board.valid_move?(move) ? board.update(move, current_player) : turn
      board.display
    end

    def play
      until over?
        turn
      end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

    def self.start
      puts "Welcome to TicTacToe!"
      puts "What kind of game would you like to play? Put 1 for single-player, 2 for two-player, and 0 to watch the computer play itself."
      choice
    end


    def self.choice
      choice = gets.strip
      until choice == "valid"
      if choice == "1"
        choice = "valid"
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      elsif choice == "2"
        choice = "valid"
        Game.new(Players::Human.new("X"), Players::Human.new("O")).play
      elsif choice == "0"
        choice = "valid"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
      else
        puts "Nope, try again silly goose!"
        self.start_game
      end
    end
  end

end
