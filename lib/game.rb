class Game

  attr_accessor :board, :player_one, :player_two

  def initialize(player_one:, player_two:, board:)
    @player_one = player_one
    @player_two = player_two
    @board = board
  end

  def turn
    if @board.over?
      return puts @board.winner ? "Congratulations #{@board.winner}!" : "Cats game!"
    end

    @board = current_player.move(@board)
    @board.display
    turn
  end

  def current_player
    @board.current_player == @player_one.token ? @player_one : @player_two
  end
end
