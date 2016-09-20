require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  # WIN_COMBINATIONS constant defines all possible location combinations that win a game
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #left diagonal
    [2,4,6] #right diagonal
  ]

#game defaults to 2 human players, X and O, with an empty board
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

#returns the Player object based on the number of moves taken in the game
  def current_player
    self.board.turn_count%2==0 ? self.player_1 : self.player_2
  end

#win returns the winning combinations of tokens if present on board
  def win
     WIN_COMBINATIONS.detect do |combo|
      self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
      self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
      self.board.taken?(combo[0]+1)  # combo[0] + 1 required becaue of #position indexing
    end
  end

#won? monitors board status for a win
  def won?
    self.win
  end

#draw? monitors board status for draw conditions
    def draw?
      self.board.full? && !(self.won?)
    end

#over? monitors the game status, retuns true if the game is won or a draw
    def over?
      self.won? || self.draw?
    end

#returns the winner of the game
    def winner
      self.won?.nil? ? nil : self.board.cells[self.win[0]]
    end

#contains a single cycle of gameplay: first player makes a valid move, then switches to second player
    def turn
      x = self.current_player.move(self.board)

      if self.board.valid_move?(x)
        self.board.update(x, self.current_player)
        self.board.display
        #self.current_player  ** not sure if this line of code is needed; test suite passes regardless
      else
        puts "that move isn't valid; try again:"
        self.turn
      end
    end

#play manages the game, checking that the board is still playable and whether or not there's a winner
    def play
      until self.over?
        self.turn
      end
      if self.won?
        puts "Congratulations #{self.winner}!"
      else
        puts "Cats Game!"
      end
    end

#start manages the logic of running a game: 0, 1, or 2 players, who goes first/is 'X', initialize Game
    def start
      input = nil

      puts "Would you like to play a game of tic-tac-toe? Typing 'n' will exit the game. (y/n)"
      input = gets.strip.upcase

        puts "How many players?  0 = computer plays itself; 1 = you play the computer; 2 = you and a friend play (0/1/2)"
        total_players = gets.strip

        case total_players
        when "0"
          Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
        when "1"
          puts "Player 1 is X and goes first.  Type 'X' to be Player 1.\nOtherwise, type 'O' to be Player 2, and the computer will go first."
          choice = gets.strip.upcase
          if choice == "X"
            Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
          else
            Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
          end
        when "2"
          puts "Player 1 is X and goes first; Player 2 is O."
          Game.new().play
        end

        exit_game
    end

#exit_game controls ending of game
  def exit_game
    puts "Okay, bye then!"
  end

end
