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

 def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    ( board.turn_count % 2 == 0 ? @player_1 : @player_2 )
  end

  def over?
    board.full? || won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]
      
      return win_combination if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
    return false
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    puts " "
    puts "It's your turn, Player '#{current_player.token}':"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      puts "That is not a valid move. Choose again."
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
      puts "Cats Game!"
    end
  end

  def play_again?
    puts " "
    puts "Play again!"
  end

  def start
    input = nil
    while input != 4
      puts "How would you like to play? Please select a number:"
      puts "1. computer vs. computer"
      puts "2. human vs. computer"
      puts "3. human vs. human"
      puts " "
      puts "4. quit"
      input = gets.strip.to_i
      case input
        when 1
          game = Game.new(Computer.new("X"), Computer.new("O"), board = Board.new)
          game.play
          play_again?
        when 2
          game = Game.new(Human.new("X"), Computer.new("O"), board = Board.new)
          puts "Player 1 will be 'X'."
          game.play
          play_again?
        when 3
          game = Game.new(Human.new("X"), Human.new("O"), board = Board.new)
          puts "Player 1 will be 'X'."
          puts "Player 2 will be 'O'."
          game.play
          play_again?
        when 4
          puts "Thanks for playing!"
        else
          puts "That's an invalid choice."
      end
    end
  end
end