puts "Welcome to Tic Tac Toe!"

  def select_players
    puts "Select number of players: 0, 1, or 2"
    input = gets.strip.to_i
    if input == 0
      @player_a = Players::Computer("X")
      @player_b = Players::Computer("O")
    elsif input == 1
      @a = Players::Human
      @b = Players::Computer
      select_token
    elsif input == 2
      @a = Players::Human
      @b = Players::Human
      select_token
    else
      select_players
    end
  end

def select_token
  puts "Which player should go first (X), 1 or 2?"
  input = gets.strip.to_i
  if input == 1
    @player_a = @a("X")
    @player_b = @b("O")
  elsif input == 2
    @player_a = @b("X")
    @player_b = @a("O")
  else
    select_token
  end
end

current_game = Game.new(player_1 = @player_a, player_2 = @player_b, board = Board.new)

until current_game.won?
  current_game.play
end