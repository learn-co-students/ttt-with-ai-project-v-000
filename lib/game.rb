class Game
  attr_accessor :player_1, :player_2, :board

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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    # collaborating objects!
    player_1.game = self
    player_2.game = self
  end

  def current_player
    board.turn_count.odd? && player_1.token == "X" ? player_2 : player_1
  end

  def over?
    self.draw? || self.won? ? true : false
    # true = draw or won
    # false = in progress (not full or no winner)
  end

  def draw?
    # if board.full? && !won? => true
    board.full? && !self.won? ? true : false
  end

  def won?
    # if the cells in any of the combos are all the same symbol
    # there should be a better way to do this
    # need to fix bc the return statements are gone
    result = nil
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"
        result = combo
      elsif board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
        result = combo
      end
    end
    result
  end

  def winner
    if !self.won?
      nil
    else
      self.won?.all?{|item| board.cells[item] == "X"} ? winner = "X" : winner = "O"
    end
  end

  def turn
    puts "Player #{self.current_player.token} it's your turn."
    move = self.current_player.move(current_player.token)
    if self.board.valid_move?(move)
      self.board.update(move, self.current_player)
      self.board.display
    else
      puts "Invalid move. Please try again"
      self.turn
    end
  end

  def play
    self.board.display
    while !self.over?
      self.turn
    end
    if self.draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{self.winner}!"
    end
  end

  def self.start
    puts "How many players? (0-2)"
    players = gets.strip
    # if 0 start comp vs comp game
    if players.to_i == 0
      game = self.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    # if 1 start comp vs human game
    elsif players.to_i == 1
      puts "Would you like to go first and be X? (Y/n)"
      if ["yes", "Yes", "y", "Y"].include?(gets.strip)
        game = self.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      else
        game = self.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      end
    # if 2 start human vs human game - don't need to specify the players bc of Game.new default args
    elsif players.to_i == 2
      game = self.new
    else #prevents it from exiting when the user has a typo
      puts "Invalid input. Please try again."
      self.start
    end
    game.play
    game.repeat?
  end

  def repeat?
    puts "Would you like to play another game? (Y/n)"
    if ["yes", "Yes", "y", "Y"].include?(gets.strip)
      self.class.start
    # elsif gets.strip == "wargames"
    #   self.class.wargames
    end
  end

  # def self.wargames
  #   draws = 0
  #   100.times do |game|
  #     game = self.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
  #     game.play
  #     draws += 1 if game.winner == nil
  #   end
  #   puts "There were #{100-draws} winners in 100 games."
  # end

end
