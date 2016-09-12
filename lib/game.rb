class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
    board.display_positions
  end

  #These methods relate to the state of the game:
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.any? do |wc|
      board.cells[wc[0]] == "X" && board.cells[wc[1]] == "X" && board.cells[wc[2]] == "X" ||
      board.cells[wc[0]] == "O" && board.cells[wc[1]] == "O" && board.cells[wc[2]] == "O"
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      WIN_COMBINATIONS.select do |wc|
        if board.cells[wc[0]] == "X" && board.cells[wc[1]] == "X" && board.cells[wc[2]] == "X"
          return "X"
        elsif board.cells[wc[0]] == "O" && board.cells[wc[1]] == "O" && board.cells[wc[2]] == "O"
          return "O"
        end
      end
    end
  end

  #Methods related to managing a game

  def self.start
    puts "What kind of game would you like to play: 0, 1, or 2 players?"
    input = gets.strip
    if input == "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    elsif input == "1"
      start_1_player
    elsif input == "2"
      Game.new
    elsif input == "wargames"
      puts "Executing wargames"
      sleep(0.5)
      wargames
      puts "Game 100"
      sleep(0.1)
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    else
      puts "I didn't understand that."
      start
    end
  end

  def self.start_1_player
    puts "Who should go first and be 'X'? (Human/Computer)"
    input = gets.strip.upcase
    if input == "HUMAN"
      Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
    elsif input == "COMPUTER"
      Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
    else
      puts "I didn't understand that."
      start_1_player
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      puts "That is not a valid move."
      turn
    end
    board.display
  end

  def play_again?
    puts "Would you like to play again? (Y/N)"
    input = gets.strip.upcase
    if input == "Y"
      game = Game.start
      game.play
      play_again?
    elsif input == "N"
      puts "Thanks for playing!"
    else
      puts "I didn't understand that."
      play_again?
    end
  end

  def self.wargames
    counter = 1
      until counter == 100
      puts "Game #{counter}"
      sleep(0.01)
      game= Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      game.play
      counter+=1
    end
  end

end
