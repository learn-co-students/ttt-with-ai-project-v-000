class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [2,4,6]]

  def initialize(player_1_obj = nil, player_2_obj = nil, board_obj = nil)
    if [player_1_obj, player_2_obj, board_obj].all? { |elem| elem == nil }
      self.player_1 = Players::Human.new('X')
      self.player_2 = Players::Human.new('O')
      self.board = Board.new
    else
      self.player_1 = player_1_obj
      self.player_2 = player_2_obj
      self.board = board_obj
    end
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.won? || self.draw? #self.board.full?
  end

  def won?
    WIN_COMBINATIONS.find do |combination|
      combination.all? { |index| self.board.cells[index] == "X"} ||
      combination.all? { |index| self.board.cells[index] == "O"}
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    self.board.cells[self.won?.first] if self.won?
  end

  def turn
    puts "It's your turn #{self.current_player.token}!"
    input = self.current_player.move(self.board)

    if !self.board.valid_move?(input)
      self.turn
    end

    self.board.update(input, self.current_player)
    self.board.display
  end

  def play
    self.board.display
    until self.over?
      self.turn
    end

    self.draw? ? (puts "Cat's Game!") : (puts "Congratulations #{winner}!")
  end

  def start
    puts "What kind of game would you like to play?"
    puts "-----------------------------------------"
    puts "-----------------------------------------"
    puts "---Enter <'0'> for Computer vs Computer--"
    puts "---Enter <'1'> for Human vs Computer-----"
    puts "---Enter <'2'> for Human vs Human--------"
    puts "---Enter <'wargames'> for nuclear war----"
    puts "-----------------------------------------"
    puts "-----------------------------------------"

    game_selection = gets.chomp

    case game_selection
    when '0'
      Game.new(Players::Computer.new('X'), Players::Computer.new('O'), Board.new).play
    when '1'
      puts "Do you want to go first? <y/Y>"
      puts "<Any other key to go second>"
      input = gets.chomp
      if input == 'y' || input == 'Y'
        Game.new(Players::Human.new('X'), Players::Computer.new('O'), Board.new).play
      else
        Game.new(Players::Computer.new('X'), Players::Human.new('O'), Board.new).play
      end
    when '2'
      Game.new.play
    when 'wargames'
      x_wins = 0
      o_wins = 0
      cats_games = 0
      100.times do
        game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'), Board.new)
        game.play
        x_wins += 1 if game.winner == 'X'
        o_wins += 1 if game.winner == 'O'
        cats_games += 1 if game.draw?
      end
      puts "X won #{x_wins} games"
      puts "O won #{o_wins} games"
      puts "#{cats_games} Cat's Games"
    end

    puts "Would you like to play again? <y/Y>"
    puts "<Any other key to quit>"
    input = gets.chomp
    self.start if input == 'y' || input == 'Y'
  end
end
