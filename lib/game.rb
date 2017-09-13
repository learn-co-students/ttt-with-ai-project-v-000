class Game

  #player_1 provides access to player_1
  #player_2 provides access to player_2

  attr_accessor :board, :player_1, :player_2

  # ::WIN_COMBINATIONS defines a constant WIN_COMBINATIONS with arrays for each win combination

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

  # initialize accepts 2 players and a board
  #initialize defaults to two human players, X and O, with an empty board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  #current_player returns the correct player, X, for the third move

  def current_player
    self.board.turn_count.even?? self.player_1 : self.player_2
  end

  def last_player_turn
    self.board.turn_count.odd?? self.player_1 : self.player_2
  end

  #over? returns true for a draw
  #over? returns true for a won game
  #over? returns false for an in-progress game

  def over?
    self.won? || self.draw?
  end

  #won? returns false for a draw
  #won? returns the correct winning combination in the case of a win
  #won? isn't hard-coded

  def won?
    WIN_COMBINATIONS.detect do |win_combination|

      # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
      # grab each index from the win_combination that composes a win, and load the value of the board at position x

      position_1 = self.board.cells[win_combination[0]] # load the value of the self.class at win_index_1
      position_2 = self.board.cells[win_combination[1]] # load the value of the self.class at win_index_2
      position_3 = self.board.cells[win_combination[2]] # load the value of the self.class at win_index_3

      position_1 == position_2 && position_2 == position_3 && (position_1 == self.player_1.token || position_1 == self.player_2.token)
    end
  end


  #draw? returns true for a draw
  #draw? returns false for a won game
  #draw? returns false for an in-progress game

  def draw?
    self.board.full? && !self.won?
  end

    #winner returns X when X won
    #winner returns O when O won
    #winner returns nil when no winner

  def winner
    self.won?? self.board.cells[self.won?[0]] : nil
  end

  # turn makes valid moves
  # turn asks for input again after a failed validation
  # turn changes to player 2 after the first turn

  def turn
      move = self.current_player.move(self.board)
      # binding.pry
      if self.board.valid_move?(move)
        self.board.update(move, self.current_player)
      else
        self.turn
      end
  end


  # play asks for players input on a turn of the game
  # play checks if the game is over after every turn
  # play checks if the game is won after every turn
  # play checks if the game is a draw after every turn
  # play stops playing if someone has won
  # play congratulates the winner
  # play stops playing in a draw
  # play prints "Cat's Game!" on a draw
  # plays through an entire game

  def play

    until self.over?
      self.turn
    end

    if self.won?
      self.board.display
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      self.board.display
      puts "Cat's Game!"
    end

  end

end
