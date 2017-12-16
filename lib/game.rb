class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    # def initialize(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new) ## TEMPORARY - for debugging
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      @board.turn_count.even? ? @player_1 : @player_2
    end

    def over?
       self.draw? || self.won?
    end

    def won?
      WIN_COMBINATIONS.detect { | combo | @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " " }
    end

    def draw?
      @board.turn_count == 9 && !self.won?
    end

    def winner
      self.won? ? @board.cells[self.won?[0]] : nil
    end

    def turn
      player_move = self.current_player.move(@board)
      puts "#{current_player.token} chooses position #{player_move}"
      # sleep 1
      self.board.cells[self.board.input_to_index(player_move)] = current_player.token
      self.board.turn_count
      self.board.display
      # sleep 1
      puts "\n"
    end

    def play
      while !self.over? do
        self.turn
      end
      if self.won?
        puts "Congratulations #{self.winner}!"
      else
        puts "Cat's Game!"
      end

    end

end
