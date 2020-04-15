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
    (board.turn_count % 2) == 0 ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      position_1 = board.cells[win_combo[0]]
      position_2 = board.cells[win_combo[1]]
      position_3 = board.cells[win_combo[2]]

      position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      end
  end

  def draw?
    !won? && !board.cells.include?(" ")
  end

  def over?
    won? || draw?
  end

  def winner
    if winner = won?
      board.cells[winner[0]]
    end
  end

  def turn
    board.display
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      puts "Invalid move. Please try again."
      turn
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players will be playing? Enter 0, 1, or 2"
    number_of_players = gets.chomp
    if number_of_players.to_i == 0
          Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    elsif number_of_players.to_i == 1
      puts "Would you like to be X and go first or be O and go second? Enter X or O"
      player_choice = gets.chomp
      if player_choice.capitalize == "X"
        Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      else
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      end
    else
      Game.new
    end

  end

end
