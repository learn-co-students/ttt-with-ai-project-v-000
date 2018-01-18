class Game

  attr_accessor :board, :player_1, :player_2

 WIN_COMBINATIONS = [
    [0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    value = board.turn_count
    if value % 2 == 0
      return player_1
    else
      return player_2
    end
  end

  def over?
    !self.board.cells.include? " "
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
      self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
      self.board.taken?(combo[0]+1)
    end
  end

  def draw?
    over? && !won?
  end

  def winner
    if won?
      return self.board.cells[won?[0]]
    end
  end

  def turn
    current_player.board = board
    number = current_player.move(board)
    if board.valid_move?(number)
      board.update(number, current_player)
    else
      turn
    end
  end

  def play
    until won? || draw?
      board.display
      turn
    end
    if draw?
      board.display
      puts "Cat's Game!"
    elsif won?
      board.display
      puts "Congratulations #{winner}!"
    end
  end

  def self.start
      puts "Welcome to tic tac toe!"
      puts "How many players? Enter 0,1,2"
      players = gets.strip
      puts "Who goes first? Enter 1 or 2"
      first = gets.strip
      if players == "2"
        game = Game.new
        game.play
      elsif players == "1" && first == "1"
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
        game.play
      elsif players == "1" && first == "2"
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
        game.play
      elsif players == "0"
        game = Game.new(player_1 = Players::Computer.new("X"),player_2 = Players::Computer.new("O"))
        game.play
      end
      puts "play again? yes or no"
      input = gets.strip
      if input == "yes"
        self.start
      end
    end



end
