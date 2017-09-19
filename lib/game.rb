# provides access to the board
# provides access to player_1
# provides access to player_2
# accepts 2 players and a board
# defaults to two human players, X and O, with an empty board

class Game
  # improve readability of array like that
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]

]


  def self.win_combinations
    WIN_COMBINATIONS
  end

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


# returns the correct player, X, for the third move
  def current_player
    #
    # Just check the turn count. If it is an odd number, it is player_2's turn
    # if self.board.cells.count(self.player_1.token) == self.board.cells.count(self.player_2.token)
    #   player_1
    # else
    #   player_2
    # end
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end


  # returns true for a draw
  # returns true for a won game
  # returns false for an in-progress game
  def over?
    # We only want it to check if the game was #won? or a #draw?
    # true unless self.board.cells.include?(" ")
    self.won? || self.draw?
  end
# Returns an array of pieces per the array of win combos. Will be all pieces on board, more or less.
  # def token_combinations
  #   self.class.win_combinations.map do |set|
  #     set.map do |position|
  #       self.board.position((position + 1).to_s)
  #     end
  #   end
  # end
# Draws out the first winning set
  # def win_set
  #   self.token_combinations.find {|a| a == ["X", "X", "X"] || a == ["O", "O", "O"]}
  # end
  # returns false for a draw
  # returns the correct winning combination in the case of a win
  def won?
    # if self.win_set
    #   index_of_win_combo = self.token_combinations.index{|x| x == self.win_set}
    #   self.class.win_combinations[index_of_win_combo]
    # end

    #
    # Take each win combo and #find. Each combo will go in and we want to compare
    # combo[0] to combo[1] and also combo[1] to combo[2]. and we want to make sure
    # they aren't empty or else we'll return true for a #won? game that's empty.

    self.class.win_combinations.find do |combo_ary|
      self.board.cells[combo_ary[0]] == self.board.cells[combo_ary[1]] &&
      self.board.cells[combo_ary[1]] == self.board.cells[combo_ary[2]] &&
      self.board.taken?(combo_ary[0] + 1)
    end
  end
  # returns true for a draw
  # returns false for a won game
  # returns false for an in-progress game
  def draw?
    self.board.full? && !won?
  end
# returns X when X won
# returns O when O won
# returns nil when no winner
  def winner
    self.board.cells[self.won?[0]] if self.won?
  end
  # asks for input again after a failed validation
  # changes to player 2 after the first turn
  # asks for players input on a turn of the game
  def turn
    # current player > move him > check if valid > update the board  unless invalid > display
    input = self.current_player.move(self.board)
    # ask for input
    # get input
    # convert input to index
    # if index is valid
    #   make the move for index
    #   show the board
    # else
    #   ask for input again until you get a valid input
    # end


    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      self.board.display
    else
      self.turn
    end

  end
  # checks if the game is over after every turn
  # plays the first turn of the game
  # plays the first few turns of the game
  # checks if the game is won after every turn
  # checks if the game is a draw after every turn
  # stops playing if someone has won
  # congratulates the winner X
  # congratulates the winner O
  # stops playing in a draw
  # prints "Cat\'s Game!" on a draw
  # plays through an entire game
  def play
    while !over?
      self.turn
    end
    if self.wo

    end



  end
end
