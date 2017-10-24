class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8], #Right Column
    [0,4,8], #Diagonal from top right
    [6,4,2]  #Diagonal from top left
    ]

    def current_player
      board.turn_count.even? ? @player_1 : @player_2
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        board.position(combo[0] + 1) == board.position(combo[1] + 1) &&
        board.position(combo[1] + 1) == board.position(combo[2] + 1) &&
        board.taken?(combo[0] + 1)
      end
    end

    def over?
      won? || draw?
    end

    def draw?
      board.full? && !won?
    end

    def winner
      won? ? board.cells[won?[0]] : nil
    end

    def turn
      board.display
      cell = current_player.move(board)
      if board.valid_move?(cell)
        wait_time
        board.update(cell, current_player)
      else
        puts "\nInvalid move. Try again, #{current_player.token}!"
        turn
      end
    end

    def play
      turn until over?
      board.display
    end

    def wait_time
      if player_1.is_a?(Players::Computer) && player_2.is_a?(Players::Computer)
        sleep 0.05
      else
        sleep 0.5
      end
    end

end
