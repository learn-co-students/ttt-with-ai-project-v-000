class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS =
    [
    [0,1,2], #top row
    [3,4,5], #mid row
    [6,7,8], #bottom row
    [0,4,8], #right diag
    [2,4,6], #left diag
    [0,3,6], #left column
    [1,4,7], #mid column
    [2,5,8] #right col
    ]

    def current_player
      if @board.turn_count % 2 == 0
        @player_1
      else
        @player_2
      end
    end

    def won?
      WIN_COMBINATIONS.detect do |win1|
        win1.all? { |number| @board.cells[number] == "X"} || win1.all? { |number| @board.cells[number] == "O"}
        end
      end

    def draw?
      if !won? && @board.full?
        true
      else
        false
      end
    end

    def over?
      if won? || draw?
        true
      end
    end

    def winner
      @board.cells[won?[0]] if won?
    end

    def turn
      puts "It is #{current_player.token}'s turn"
      player = current_player
      current_move = player.move(@board)
      if !@board.valid_move?(current_move)
        puts "Invalid move!"
        turn
      else
        @board.display
        current_move
        @board.update(current_move, player)
      end
    end

    def play
      while !over?
        board.display
        turn
      end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      else
        puts "Cats Game!"
      end
    end

end
