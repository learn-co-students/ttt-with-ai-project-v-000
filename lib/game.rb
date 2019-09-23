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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    winner = WIN_COMBINATIONS.select do |combo|
              board.cells[combo[0]] == board.cells[combo[1]] &&
              board.cells[combo[1]] == board.cells[combo[2]] &&
              board.taken?(combo[0] + 1)
            end

    if winner.count == 0
      false
    elsif winner.count == 1
      winner.flatten
    else
      if winner[0][0] == winner[1][0]
        winner[0]
      else
        winner.detect {|combo| board.cells[combo[0]] == player_1.token}
      end
    end

  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      winner = won?
      board.cells[winner[0]]
    end
  end

  def computer_game
    self.player_1 = Players::Computer.new("X")
    self.player_2 = Players::Computer.new("O")
    self.board = Board.new
    board.display
    play
  end

  def one_player_game
    puts "Who should go first and play as X? For Yourself Enter [1], For the Computer Enter [2] :"
    first = gets.strip

    if first == "1"
      self.player_1 = Players::Human.new("X")
      self.player_2 = Players::Computer.new("O")
      self.board = Board.new
      board.display
      play
    elsif first == "2"
      self.player_1 = Players::Computer.new("X")
      self.player_2 = Players::Human.new("O")
      self.board = Board.new
      play
    else
      one_player_game
    end
  end

  def two_player_game
    puts "Whoever's playing X goes first!"
    self.player_1 = Players::Human.new("X")
    self.player_2 = Players::Human.new("O")
    self.board = Board.new
    board.display
    play
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    again = ""

    while again[0] != "n" && again[0] != "N"
      puts "Would you like to play with 0, 1, or 2 Players? :"
      input = gets.strip

      case input
      when "0"
        computer_game
      when "1"
        one_player_game
      when "2"
        two_player_game
      end
      puts "Would you like to play again? (Y/N) :"
      again = gets.strip
    end
  end

  def play
    until over?
      turn
      board.display
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def turn
    puts "Enter a number [1-9]:"
    input = current_player.move(board)

    if board.valid_move?(input)
      board.update(input, current_player)
    else
      turn
    end
  end

end
