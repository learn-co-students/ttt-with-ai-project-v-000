class Cli

  attr_accessor :game

  def initialize
  end

  def play_game
    self.game.play
  end

  def create_game(num_players, first_player)
    if first_player == 1
      if num_players == 0
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")
      elsif num_players == 1
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
      elsif num_players == 2
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      end
    elsif first_player == 2
      if num_players == 0
        player_1 = Players::Computer.new("O")
        player_2 = Players::Computer.new("X")
      elsif num_players == 1
        player_1 = Players::Human.new("O")
        player_2 = Players::Computer.new("X")
      elsif num_players == 2
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      end
    end
    self.game = Game.new(player_1, player_2)
  end

  def play_again?
    puts "Play another game? (y/n)"
    yn = gets.strip.upcase

    if yn[0] == "Y"
      puts "Do you want to change the settings?"
      yn = gets.strip.upcase
      if yn[0] == "Y"
        self.setup_game
      else
        self.game.board.reset!
      end
      return true
    else
      puts "Thanks for playing!"
      return false
    end
  end

  # def player_turn_prompt(current_player, player_num)
  #   valid = false
  #   while !valid do
  #     puts "Make your move, Player #{player_num}."
  #     self.board.display
  #     move = current_player.move(board)
  #     if self.board.valid_move?(move)
  #       self.board.update(move, current_player)
  #       valid = true
  #     else
  #       puts "Invalid move. Instructions for playing Tic-Tac-Toe can be found here: https://en.wikipedia.org/wiki/Tic-tac-toe"
  #     end
  #   end
  # end

  def integer_input_validation_loop(validation, prompt = "")
    puts prompt
    input = gets.strip.to_i
    valid = false
    while !valid do
      valid = validation.(input)
    end
    return input
  end

  def setup_game
    game_type = ->(num_players) do
      if num_players == 0 || num_players == 2
        return true
      elsif num_players == 1
        puts "In a single player game, Player 1 will be human while Player 2 will be computer."
        return true
      else
        puts "Invalid selection!"
        puts "Please enter 0, 1 or 2."
        num_players = gets.strip.to_i
        return false
      end
    end
    num_players = self.integer_input_validation_loop(game_type, "Will there be 0, 1 or 2 players?")
    # puts "Will there be 0, 1 or 2 players?"
    # num_players = gets.strip.to_i
    # valid = false
    # while !valid do
    #   if num_players == 0 || num_players == 2
    #     valid = true
    #   elsif num_players == 1
    #     puts "In a single player game, Player 1 will be human while Player 2 will be computer."
    #     valid = true
    #   else
    #     puts "Invalid selection!"
    #     puts "Please enter 0, 1 or 2."
    #     num_players = gets.chomp.to_i
    #   end
    # end
    go_first = ->(first_player) do
      # if num_players == 0 && first_player == 1
      #   player_1 = Players::Computer.new("X")
      #   player_2 = Players::Computer.new("O")
      #   self.game = Game.new(player_1, player_2)
      #   valid = true
      # elsif num_players == 0 && first_player == 2
      #   player_2 = Players::Computer.new("X")
      #   player_1 = Players::Computer.new("O")
      #   self.game = Game.new(player_1, player_2)
      #   valid = true
      # elsif num_players == 1 && first_player == 1
      #   player_1 = Players::Human.new("X")
      #   player_2 = Players::Computer.new("O")
      #   self.game = Game.new(player_1, player_2)
      #   valid = true
      # elsif num_players == 1 && first_player == 2
      #   player_1 = Players::Human.new("O")
      #   player_2 = Players::Computer.new("X")
      #   self.game = Game.new(player_1, player_2)
      #   valid = true
      # elsif num_players == 2 && first_player == 1
      #   player_1 = Players::Human.new("X")
      #   player_2 = Players::Human.new("O")
      #   self.game = Game.new(player_1, player_2)
      #   valid = true
      # elsif num_players == 2 && first_player == 2
      #   player_1 = Players::Human.new("O")
      #   player_2 = Players::Human.new("X")
      #   self.game = Game.new(player_1, player_2)
      #   valid = true
      if (first_player == 1 || first_player == 2) && (num_players == 1 || num_players == 2 || num_players == 0)
        self.create_game(num_players, first_player)
        valid = true
      else
        puts "Invalid selection!"
        puts "Please enter 1 or 2."
        first_player = gets.strip.to_i
      end
    end
    first_player = self.integer_input_validation_loop(go_first, "Should Player 1 or Player 2 play X and go first?")

    # puts "Should Player 1 or Player 2 play X and go first?"
    # first_player = gets.strip.to_i
    # valid = false
    # while !valid do
    #   if num_players == 0 && first_player == 1
    #     player_1 = Players::Computer.new("X")
    #     player_2 = Players::Computer.new("O")
    #     valid = true
    #   elsif num_players == 0 && first_player == 2
    #     player_2 = Players::Computer.new("X")
    #     player_1 = Players::Computer.new("O")
    #     valid = true
    #   elsif num_players == 1 && first_player == 1
    #     player_1 = Players::Human.new("X")
    #     player_2 = Players::Computer.new("O")
    #     valid = true
    #   elsif num_players == 1 && first_player == 2
    #     player_1 = Players::Human.new("O")
    #     player_2 = Players::Computer.new("X")
    #     valid = true
    #   elsif num_players == 2 && first_player == 1
    #     player_1 = Players::Human.new("X")
    #     player_2 = Players::Human.new("O")
    #     valid = true
    #   elsif num_players == 2 && first_player == 2
    #     player_1 = Players::Human.new("O")
    #     player_2 = Players::Human.new("X")
    #     valid = true
    #   else
    #     puts "Invalid selection!"
    #     puts "Please enter 1 or 2."
    #     first_player = gets.chomp.to_i
    #   end
    # end
    # self.game = Game.new(player_1, player_2)
    # self.game.cli = self
  end
end
