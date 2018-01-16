class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right column
    [0,4,8],  # Forward diagonal
    [2,4,6]  # Backward diagonal
  ]

  @@win_count = 0

  def board
    @board
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    self.draw? || self.won? ? true : false
  end

  def won?
    winner = false
    WIN_COMBINATIONS.detect do |win_combo|
      check = win_combo.collect {|position| self.board.cells[position]}
      if check.all? {|token| token == player_1.token}
        winner = win_combo
      elsif check.all? {|token| token == player_2.token}
        winner = win_combo
      end
    end
  end

  def draw?
    self.board.turn_count == 9 && !self.won? ? true : false
  end

  def winner
    self.board.cells[self.won?[0]] if self.won?
  end

  def turn
    player = current_player
    puts ""
    puts "#{player.type} player #{player.token} is up."
    move = player.move(@board)
    if !self.board.valid_move?(move)
      turn
    else
      puts ""
      self.board.update(move, player)
      self.board.display
    end
  end

  def play
    while !self.over?
      turn
    end
    if self.won?
      @@win_count += 1
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
    # play
  end

  def self.start
    puts ""
    puts "Welcome to Tic-Tac-Toe with AI!"
    player_count = nil
    while !["0", "1", "2", "wargames"].include?(player_count)
      puts "How many humans are playing?(Please Enter between 0 and 2)"
      player_count = gets.strip
    end
    if player_count == "0"
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")
    elsif player_count == "1"
      order = nil
      while !["1", "2"].include?(order)
        puts "First player is 'X', and second player is 'O'"
        puts "Enter 1 to go first, and 2 to go second"
        order = gets.strip
      end
      if order == "1"
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
      elsif order == "2"
        player_1 = Players::Computer.new("X")
        player_2 = Players::Human.new("O")
      end
    elsif player_count == "2"
      player_1 = Players::Human.new("X")
      player_2 = Players::Human.new("O")
    elsif player_count == "wargames"
      self.wargames
      exit!
    end
    game = self.new(player_1, player_2, Board.new)
    puts ""
    puts "--------------"
    puts "Let's do this!"
    puts "--------------"
    puts ""
    game.board.display
    game.play
    game.again?
  end

  def again?
    puts ""
    puts "Play again?"
    puts "(y) to play, (n) to exit"
    input = gets.strip.downcase
    self.class.start if input == "y"
    puts "Thanks for playing!" if input == "n"
    self.again? if !["y", "n"].include?(input)
  end

  def self.wargames
    @@win_count = 0
    puts ""
    puts "--------------"
    puts "   WAR GAMES  "
    puts "--------------"
    puts ""
    puts "How many battles are about to take place?"
    count = gets.strip.to_i
    if count >= 1
      count.times do
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")
        game = self.new(player_1, player_2, Board.new)
        game.play
      end
      puts ""
      puts "~Recap~"
      puts "#{count} battles took place, and #{@@win_count} were won!"
    end
  end
end
