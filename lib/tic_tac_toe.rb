class TicTacToe
  attr_accessor :game, :game_choice, :input_output

  def does_user_want_to_quit?
    self.input_output.display "Do you want to play again?"
    answer = self.input_output.read
    %w(n no).include?(answer.downcase)
  end

  def initialize(game, io)
    self.game = game
    self.input_output = io
  end

  def play
    self.input_output.display "Welcome to Tic Tac Toe!"
    self.input_output.display "========================="
    self.start
  end

  def start
    user_has_quit = false

    until user_has_quit
      self.game = select_game_type
      if self.game_choice == "4"
        self.game.play_wargames
        self.game.display_scores
      else
        self.game.board.display
        self.game.play
      end
      user_has_quit = self.does_user_want_to_quit?
    end
  end

  def select_game_type
    self.input_output.display "What kind of game would you like to play?"
    self.input_output.display "1. 0 player (Press 1 for 0 player game)"
    self.input_output.display "2. 1 player (Press 2 for 1 player game)"
    self.input_output.display "3. 2 player (Press 3 for 2 player game)"
    self.input_output.display "4. WARGAMES (Press 4 for WARGAMES)"
    self.game_choice = self.input_output.read

    case self.game_choice
    when "1"
      self.input_output.display "You have selected 0 player game."
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"))

    when "2"
      self.input_output.display "You have selected 1 player game."
      self.input_output.display "Who should go first and be player X?"
      player_choice = self.input_output.read

      if player_choice.downcase == "i"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      else
        Game.new(Players::Computer.new("X"), Players::Human.new("O"))
      end
      
    when "3"
      self.input_output.display "You have selected 2 player game."
      Game.new

    when "4"
      self.input_output.display "You are playing WARGAMES"
      Wargames.new

    else
      self.input_output.display "Please select the game from options 1, 2, 3 or 4 from the menu!"
      raise "Wrong choice type!!"
    end
  end
end
