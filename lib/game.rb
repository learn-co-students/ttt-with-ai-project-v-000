class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.odd? ? player_2 : player_1
  end

  def over?
    won? || draw?
  end

  def won?
    win_combination ? true : false
  end

  def draw?
    !won? && self.board.full?
  end

  def winner
    self.board.cells[win_combination.first] if over?
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

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
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
    game = select_game_type
    game.board.display
    until game.over?
      game.play
    end
    play_again?
  end

  def play_again?
    answer = " "
    until (answer.downcase == "n" || answer.downcase == "no")
      puts "Do you want to play again?"
      answer = gets.strip
      if answer.downcase == "y" || answer.downcase == "yes"
        start
      end
    end
  end

  private

  def win_combination
    WIN_COMBINATIONS.each do |win_combination|
      player_at_position1 = board.cells[win_combination[0]]
      player_at_position2 = board.cells[win_combination[1]]
      player_at_position3 = board.cells[win_combination[2]]
      if (player_at_position1 == "X" && player_at_position2 == "X" && player_at_position3 == "X") || (player_at_position1 == "O" && player_at_position2 == "O" && player_at_position3 == "O")
        return win_combination
      end
    end
    false
  end
end
