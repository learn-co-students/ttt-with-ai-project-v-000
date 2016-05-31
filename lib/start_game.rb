class StartGame

  attr_accessor :number_players, :player_1, :player_2, :board

  def initialize
    self.prep_game
    self.launch_game
  end

  def prep_game
    number_players = prep_players
    if number_players == 0
      player_1 = Player::Computer.new("X")
      player_2 = Player::Computer.new("O")
    end
    if number_players == 1
      player_1 = Player::Human.new(self.prep_token_player_1)
      player_2 = Player::Computer.new(self.prep_token_player_2(player_1))
    end
    if number_players == 2
      player_1 = Player::Human.new(self.prep_token_player_1)
      player_2 = Player::Human.new(self.prep_token_player_2(player_1))
    end
    board = Board.new
  end

  def launch_game
    game = Game.new(player_1, player_2, board)
    game.board.display
    game.play
    puts "would you like to play again?(\"Y\" or \"N\")"
    input = gets.strip
    if input == "Y"
      self.prep_game
      self.launch_game
    end
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
