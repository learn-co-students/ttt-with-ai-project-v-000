class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def over?
    won? || draw?
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end
  
   def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end
  
  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def self.number_players
    player_number = gets.strip
    if player_number.to_i == 0
      game = self.new(Players::Computer.new("X"), Players::Computer.new("O"))
      game.play
      game.game_over_message
    elsif player_number.to_i == 1
      puts "Do you want to be X or O?"
      input = gets.strip
      if input == "X" ||  input == "x"
        game = self.new(Players::Human.new("X"), Players::Computer.new("O"))
        game.play
        game.game_over_message
      elsif input == "O" || input == "o"
        game = self.new(Players::Computer.new("X"), Players::Human.new("O"))
        game.play
        game.game_over_message
      else
        puts "Enter X or O silly!"
      end
    elsif player_number.to_i == 2
      puts "X moves first!"
      game = self.new
      game.play
      game.game_over_message
    else
      puts "Tic Tac Toe is only for up to 2 people, Alan!"
      sleep(1)
      self.start
    end
  end
    
  def game_over_message
    if self.over?
      puts "Would you like to play again? y/n"
      ans = gets.strip
      if ans == "y" || ans == "Y"
        Game.start
      end
    end
  end

  
  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts "Please select number of players: (0, 1, 2)"
    self.number_players
  end
end