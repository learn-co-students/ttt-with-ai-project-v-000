class Game
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]
  attr_accessor :board, :player_1, :player_2


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      self.player_1
    else
      self.player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      # binding.pry
    self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
    self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
    self.board.cells[combo[0]] != " "
    end
  end

  def draw?
    # a = self.board.cells.all?{|a| a == "X" || a == "O"}
    self.board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if self.board.cells.count("X") > self.board.cells.count("O")
      "X"
    elsif self.board.cells.count("X") < self.board.cells.count("O")
      "O"
    else
      nil
    end
  end

  def turn

    a = current_player.move(self.board)
    self.board.update(a, self.current_player)
  end

  def play
    until over?
      turn
    end
    self.board.display
    if won?
        puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
  end

    def start
      puts "Welcome to Tic-tac-toe"
      puts "Choose your player: 0 player mode,1 player mode, or 2 player mode"
      input = gets.strip
      if input == "0 player mode"
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      end
      if input == "1 player mode"
          puts "Who wants to go first:player_1, player_2"
          player == gets.strip
          if player == "player_1"
            Game.new(player_1 = Players::Human.new("X") , player_2 = Players::Computer.new("O"), board)
          elsif player == "player_2"
            Game.new(player_1 = Players::Computer.new("X") , player_2 = Players::Human.new("O"), board)
          end
        end
      if input == "2 player mode"
          Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board)
      end

    end



end
