class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6] ]

    def current_player
      self.board.turn_count.even? ? player_1 : player_2
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        combo.all? {|cell| board.cells[cell] == player_1.token} || combo.all? {|cell| board.cells[cell] == player_2.token}
      end
    end

    def draw?
      !won? && board.full?
    end

    def over?
      won? || draw? || board.full?
    end

    def winner
      if won?
        player_1.token == board.cells[won?[0]] ? player_1.token : player_2.token
      end
    end

    def turn
      puts "Please enter 1-9:"
      index = current_player.move(board)
      if board.valid_move?(index)
        board.update(index, current_player)
        board.display
      else
        turn
      end
    end

    def play
      until over?
        turn
      end

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

    def self.start
      puts "Welcome!"
      puts "How many players: 0, 1, or 2?"
        player_count = gets.strip.to_i

        case player_count
        when 0
          player_1 = Players::Computer.new("X")
          player_2 = Players::Computer.new("O")
        when 1
          player_1 = Players::Human.new("X")
          player_2 = Players::Computer.new("O")
        when 2
          player_1 = Players::Human.new("X")
          player_2 = Players::Human.new("O")
        end
      game = Game.new(player_1, player_2)
      game.play
    end

end
