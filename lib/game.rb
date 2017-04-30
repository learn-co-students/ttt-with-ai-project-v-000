#####::WIN_COMBINATIONS
#defines a constant WIN_COMBINATIONS with arrays for each win combination
#####board
#provides access to the board
#####player_1
#provides access to player_1                                                                                                                                       
#####player_2
#provides access to player_2
#####initialize
#accepts 2 players and a board
#defaults to two human players, X and O, with an empty board
#####current_player
#returns the correct player, X, for the third move
#####over?
#returns true for a draw
#returns true for a won game
#returns false for an in-progress game
#####won?
#returns false for a draw
#returns true for a win
#####draw?
#returns true for a draw
#returns false for a won game
#returns false for an in-progress game
#####winner
#returns X when X won
#returns O when O won
#returns nil when no winner
#####turn
#makes valid moves
#asks for input again after a failed validation
#changes to player 2 after the first turn
#####play
#asks for players input on a turn of the game
#checks if the game is over after every turn
#plays the first turn of the game
#plays the first few turns of the game
#checks if the game is won after every turn
#checks if the game is a draw after every turn
#stops playing if someone has won
#congratulates the winner X
#congratulates the winner O
#stops playing in a draw
#prints "Cat's Game!" on a draw
#plays through an entire game

class Game
  WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2
    def initialize (player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board= Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      self.board.turn_count%2==0? player_1 : player_2
    end

    def over?
      draw? || won?
    end

    def won?
      WIN_COMBINATIONS.detect do |win_combo|
        win_combo.all?{|index| board.cells[index]=="X"} ||
        win_combo.all?{|index| board.cells[index]=="O"}
      end
    end

    def draw?
      board.full? && !won?
    end

    def winner
      board.cells[won?.first] if won?
    end

    def turn
      user_input = current_player.move(board)
      while !board.valid_move?(user_input)
        user_input = current_player.move(board)
      end
      board.update(user_input, current_player)
    end

    def play
      while !over?
        turn
      end
      if draw?
        puts "Cat\'s Game!"
      else
        puts "Congratulations #{winner}!"
      end
    end

    def self.start
      puts "Welcome to Tic-Tac-Toe AI"
      loop do
      puts "What kind of game do you want to play?"
      puts "0,1 or 2 players?"
      game_type = gets.strip

      case game_type
      when "0"
          new_game = self.new(Players::Computer.new("X"),Players::Computer.new("O"))
          new_game.board.display
          new_game.play
      when "1"
          puts "Would you like to go first and be the \"X\" player?"
          puts "press y for yes, any key for no"
          user_imput = gets.strip
      if user_imput == "y"
          new_game = self.new(Players::Human.new("X"),Players::Computer.new("O"))
          new_game.board.display
          new_game.play
      else
          new_game = self.new(Players::Computer.new("X"),Players::Human.new("O"))
          new_game.board.display
          new_game.play
      end
      when "2"
        new_game = self.new(Players::Human.new("X"),Players::Human.new("O"))
        new_game.board.display
        new_game.play
      end

      puts "Do you want to play again?"
      puts "press y for yes, any key for no"
      start = gets.strip
      break if start != "y"
    end
  end
end
