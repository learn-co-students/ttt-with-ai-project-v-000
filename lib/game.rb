class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #diagonal 1
    [2,4,6], #diagonal 2
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[2]] == @board.cells[combo[0]] && @board.taken?(combo[0] + 1)
      end
    end

    def draw?
      !won? && @board.cells.all? {|positions| positions == "X" || positions == "O"}
    end

    def over?
      draw? || won?
    end

    def winner
      if won?
        combo = won?
        board.cells[combo.first]
      else
        nil
      end
    end

    def turn
      player = current_player
      player_input = player.move(board)
      if @board.valid_move?(player_input)
        @board.update(player_input, player)
        @board.display
      else
        turn
      end
    end

    def invalid_move
      if !valid.move?(player_input)
        turn
      end
    end

    def play
      while !over?
        turn
      end

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end
