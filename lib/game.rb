class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        win_combination
      else
      end
    end
  end

  def draw?
    !won? && board.cells.none?{|i| i == nil || i == " " || i == ""}
  end

  def winner
    win_index = won?
    board.cells[win_index[0]] if win_index != nil
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    until board.valid_move?(input)
      puts "invalid"
      puts "Please enter 1-9:"
      input = current_player.move(board)
    end
    board_index = board.input_to_index(input)
    board.cells[board_index] = current_player.token
  end

  def play
    until over?
      turn
      board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def self.game_intro
    puts "What kind of game would you like to play?"
    puts "If you'd like the computer to play itself, enter '0'."
    puts "If you'd like to play against the computer, enter '1'."
    puts "If you'd like a two player game, enter '2'."
    puts "If you'd like the computer to play itself 100 times, enter 'wargames'."
  end

  def self.start(input)
    if input == "0"
      new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      new_game.play
    elsif input == "1"
      puts "Who would you like to go first and be 'X'?"
      puts "If you would like to go first, enter 'me'."
      puts "If you would like the computer to go first, enter 'computer'."
      first = gets.strip
      if first == "me"
        new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        new_game.play
      elsif first == "computer"
        new_game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
        new_game.play
      end
    elsif input == "2"
      new_game = Game.new
      new_game.play
    elsif input == "wargames"
      win_record = []
      100.times do |w|
        new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        new_game.play
        win_record << new_game.winner
      end
      if !win_record.include?("X") && !win_record.include?("O")
        puts "The game was won zero times."
      elsif win_record.include?("X") && win_record.include?("0")
        puts "The game was won #{win_record.count} times."
      end
    end
  end

  def self.replay?
    puts "Would you like to play again? Please enter 'yes' or 'no'."
    replay_input = gets.strip
    until replay_input != "yes"
      game_intro
      game_input = gets.strip
      start(game_input)
      puts "Would you like to play again? Please enter 'yes' or 'no'."
      replay_input = gets.strip
    end
  end

end
