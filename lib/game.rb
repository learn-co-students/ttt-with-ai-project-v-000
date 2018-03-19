require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [2,5,8],
    [1,4,7],
    [0,4,8],
    [2,4,6]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
      # binding.pry
    end

    # current_player either returns player 1 or player 2
    def current_player
      self.board.turn_count.odd? ? self.player_2 : self.player_1
    end

    def won?
      WIN_COMBINATIONS.each do |combo|
        arr = [self.board.cells[combo[0]], self.board.cells[combo[1]], self.board.cells[combo[2]]]
        return combo if arr == ["X","X","X"] || arr == ["O","O","O"]
      end
      false
    end

    def draw?
      if self.board.full? && self.won? == false
        true
      else
        false
      end
    end

    def over?
      if self.draw?
        true
      elsif self.won?
        true
      elsif !self.board.full? && !self.won?
        false
      end
    end

    def winner
      winner = self.won?
      self.board.cells[winner[0]] if winner
    end

    def turn
      # player going
      playing_now = self.current_player
      # player's move
      player_move = playing_now.move(board)

      if !self.board.valid_move?(player_move)
        turn
      else
        self.board.update(player_move, playing_now)
      end

    end

    def play

      until self.over?
        self.turn
      end

      if self.won?
        puts "Congratulations #{winner}!"
      elsif self.draw?
        puts "Cat's Game!"
      end


      # binding.pry

    end

end
