class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = nil, player_2 = nil, board)
    player_1 ? @player_1 = player_1 : @player_1 = Human.new("X")
    player_2 ? @player_2 = player_2 : @player_2 = Human.new("O")
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
    @board.current_player == @player_1.token ? @player_1 : @player_2
  end
end
