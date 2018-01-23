class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
   [0,1,2],  # Top row
   [3,4,5],  # Middle row
   [6,7,8],  # Bottom row
   [0,3,6],  # First column
   [1,4,7],  # Middle column
   [2,5,8],  # Last column
   [0,4,8],  # Diagonal from top left to bottom right
   [6,4,2]   # Diagonal from bottom left to top right
  ]

  # Accepts 2 players and a board.
  # Defaults to two human players, X and O, with an empty board.
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # Returns the player for the current move.
  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  # Returns true if the game is over (someone won, or it's a draw)
  def over?
    won? || draw?
  end

  # Returns the winning combination in the case of a win.
  def won?
    WIN_COMBINATIONS.detect do |combination|
      array_with_moves = [
        self.board.cells[combination[0]],
        self.board.cells[combination[1]],
        self.board.cells[combination[2]] ]

      array_with_moves.all? {|cell| cell == "X"} || array_with_moves.all? {|cell| cell == "O"}
    end
  end

  # Returns true for a draw.
  def draw?
    won? == nil && self.board.full?
  end

  # Returns the token of the winning player, or nil if a draw.
  def winner
    if draw? || !won?
      nil
    else
      self.board.cells[won?[0]]
    end
  end

  # Makes valid moves with the current_player.
  # Asks for input again after a failed validation.
  def turn
    if current_player.is_a?(Players::Human)
      valid_input = false

      until valid_input == true do
        input = current_player.move(board)
        valid_input = board.valid_move?(input)
      end

      self.board.cells[input.to_i - 1] = current_player.token

    else #computer should move
      self.board.cells[current_player.move(board).to_i - 1] = current_player.token
    end

    self.board.display
  end

  # Starts a game.
  def play
    self.board.display

    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
      1
    else
      puts "Cat's Game!"
      0
    end
  end

end # end class Game
