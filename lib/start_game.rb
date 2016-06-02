class StartGame

  attr_accessor :number_players, :player_1, :player_2, :board, :game

  def initialize
    self.prep_game
    self.launch_game
  end

  def prep_game
    self.board = Board.new
    number_players = prep_players
    if number_players == 0
      self.player_1 = Player::Computer.new("X")
      self.player_2 = Player::Computer.new("O")
    end
    if number_players == 1
      self.player_1 = Player::Human.new(self.prep_token_player_1)
      self.player_2 = Player::Computer.new(self.prep_token_player_2(player_1))
    end
    if number_players == 2
      self.player_1 = Player::Human.new(self.prep_token_player_1)
      self.player_2 = Player::Human.new(self.prep_token_player_2(player_1))
    end
  end

  def launch_game
    self.game = Game.new(self.player_1, self.player_2, self.board)
    self.game.board.display
    self.game.play
  end

  def prep_players
    puts "How many player(s) for this game (0, 1 or 2 players)?"
    number_players = gets.strip.to_i
    number_players.between?(0,2) ? number_players : self.prep_players
  end

  def prep_token_player_1
    puts "Which token for Player 1(\"X\" or \"O\")?"
    token = gets.strip
    token == "X" || token == "O" ? token : self.prep_token_player_1
  end

  def prep_token_player_2(player_1)
    player_1.token == "X" ? "O" : "X"
  end

end
