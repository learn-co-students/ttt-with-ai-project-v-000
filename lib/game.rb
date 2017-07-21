class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
  ]

  def current_player
    self.board.turn_count.odd? ? self.player_2 : self.player_1
  end

  def draw?
    !self.won? && self.board.full?
  end

  def initialize(player_1 = Players::Human.new(Board::TOKEN_CROSS), player_2 = Players::Human.new(Board::TOKEN_NOUGHT), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def over?
    self.won? || self.draw?
  end

  def play
    until self.over?
      turn
    end
    if self.won?
      puts "Congratulations #{winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

  def select_game_type
    puts "What kind of game would you like to play?"
    puts "1. 0 player (Press 1 for 0 player game)"
    puts "2. 1 player (Press 2 for 1 player game)"
    puts "3. 2 player (Press 3 for 2 player game)"
    game_choice = gets.chomp

    case game_choice
      when "1"
        puts "You have selected 0 player game."
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))

      when "2"
        puts "You have selected 1 player game."
        puts "Who should go first and be player X?"
        player_choice = gets.chomp

        if player_choice.downcase == "i"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        else
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
        end

      when "3"
        puts "You have selected 2 player game."
        game = Game.new
      else
        puts "Please select the game from options 1, 2 or 3 from the menu!"
        raise "Wrong choice type!!"
    end
    game
  end

  def start
    user_has_quit = false

    until user_has_quit
      game = select_game_type
      game.board.display
      game.play
      user_has_quit = self.does_user_want_to_quit?
    end
  end

  def does_user_want_to_quit?
    puts "Do you want to play again?"
    answer = gets.strip
    %w(n no).include?(answer.downcase)
  end

  def turn
    player = current_player
    current_move = player.move(@board)

    if self.board.valid_move?(current_move)
      puts "Turn #{self.board.turn_count + 1}"
      self.board.update(current_move, player)
      puts "Move of player #{player.token} was #{current_move}"
      self.board.display
      puts "\n\n"
    else
      turn
    end
  end

  def won?
    !!win_combination
  end

  def winner
    self.board.cells[win_combination.first] if self.over?
  end

  private

  def win_combination
    WIN_COMBINATIONS.detect do |win_combination|
      token_at_position1 = self.board.cells[win_combination[0]]
      token_at_position2 = self.board.cells[win_combination[1]]
      token_at_position3 = self.board.cells[win_combination[2]]

      Board::ALL_TOKENS.include?(token_at_position1)\
        && (token_at_position1 == token_at_position2)\
        && (token_at_position2 == token_at_position3)
    end
  end
end
