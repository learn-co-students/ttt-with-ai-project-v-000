class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    if !player_1 && !player_2 && !board
      self.player_1 = Human.new("X")
      self.player_2 = Human.new("O")
      self.board = Board.new
    else
      self.player_1 = player_1
      self.player_2 = player_2
      self.board = board
    end
  end

  def start
    puts "Welcome to Tic-Tac-Toe"

    puts "What kind of game would you like to play?\nPLAYER(S):\t0\t1\t2"
    players = gets.strip

    if players.to_i == 0
      player_1 = Computer.new("X")
      player_2 = Computer.new("O")
      Game.new(player_1, player_2, Board.new).play
    else
      puts "Who should go first?\n 1\t 2"
      first = gets

      if players.to_i == 1 && first.to_i == 1
        player_1 = Human.new("X")
        player_2 = Computer.new("O")
        Game.new(player_1, player_2, Board.new).play
      elsif players.to_i == 1 && first.to_i == 2
        player_1 = Computer.new("X")
        player_2 = Human.new("O")
        Game.new(player_1, player_2, Board.new).play
      else
        Game.new(Human.new("X"), Human.new("O"), Board.new).play
      end
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end

    puts "Play again? (Y/n)"
    # until gets.downcase != "y"
    #   start
    # end

  end

  def turn
    puts "\n"
    board.display
    puts "\n"

    if board.valid_move?(player_move = current_player.move(board))
      board.update(player_move, current_player)
      puts "\n"
      board.display
      puts "\n"
    else
      turn
    end
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def draw?
    board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.any? do |combination|
      combination.all?{|index| board.taken?(index+1) && board.position(index+1) == "X"} ||\
      combination.all?{|index| board.taken?(index+1) && board.position(index+1) == "O"}
    end
  end

  def winner
    if won?
      combination = WIN_COMBINATIONS.detect do |combination|
        combination.all?{|index| board.taken?(index+1) && board.position(index+1) == "X"} ||\
        combination.all?{|index| board.taken?(index+1) && board.position(index+1) == "O"} 
      end
      if combination
        board.cells[combination.first]
      end
    end
  end

end