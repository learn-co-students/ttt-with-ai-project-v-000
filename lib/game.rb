class Game

  attr_accessor :board, :player_1, :player_2

  Game::WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top-left to bottom-right diagonal
  [6,4,2]  # Top-right to bottom-left diagonal
    ]

    def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      if @board.cells.select{|space| space == " "}.count % 2 == 0
        player_2
      else
        player_1
      end
    end

    def over?
      won? || draw?
    end

    def won?
      Game::WIN_COMBINATIONS.detect do |win_combo|
        @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
        @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
        @board.taken?(win_combo[0]+1)
      end
    end

    def draw?
      @board.full? && !won?
    end

    def turn
      puts "#{self.current_player.token}'s move:"
      player_turn = self.current_player.move(board)
    until self.board.valid_move?(player_turn)
      puts "This move is not valid."
      player_turn = self.current_player.move(board)
    end
      self.board.update(player_turn, current_player)
    end

    def play
      while !over? do
        turn
      end
      if won?
        puts "Congratulations #{self.winner}!"
      else draw?
        puts "Cats Game!"
      end
    end

    def winner
      if win_combo = won?
       @winner = @board.cells[win_combo.first]
      end
    end

end
