class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
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
      Game.new(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
    elsif input == "1"
      puts "Who should go first and be 'X'? Player-1 or Computer?"
      input = gets.strip
      if input == "Player-1"
        Game.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
      elsif input == "Computer"
        Game.new(player_1=Players::Computer.new("X"), player_2=Players::Human.new("O"), board=Board.new)
      end
    elsif input == "2"
      Game.new
    else
      puts "I didn't understand that."
      start
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

end
