class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],[1, 4, 7],[2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
  board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      (board.cells[combination[0]] == board.cells[combination[1]]) && (board.cells[combination[0]] == board.cells[combination[2]]) unless board.cells[combination[0]] == " "
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def current_player
    board.turn_count.even? ? player = player_1 : player_2
  end

  def turn
    puts "#{current_player.name}, please make a choice: "
    index = current_player.move(board)
    if board.valid_move?(index)
      board.update(index, current_player)
      board.display
    else
      puts "That is not a valid choice. Please enter a valid number 1-9:"
      turn
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

  def self.start
    puts "How many human players are playing today?"
    players = " "
    until (players == 0) || (players == 1) || (players == 2)
      players = gets.chomp.to_i
      if (players != 0) && (players != 1) && (players != 2)
        puts "There's only three choices. Try again..."
      end
    end
    if players == 0
      player_1 = Players::Computer.new('X')
      player_1.name = "Computer1"
      player_2 = Players::Computer.new('O')
      player_2.name = "Computer2"
    elsif players == 1
      player_1 = Players::Human.new('X')
      puts "Please input player 1's name:"
      player_1.name = gets.chomp
      player_2 = Players::Computer.new('O')
      player_2.name = "Computer2"
    elsif players == 2
      player_1 = Players::Human.new('X')
      puts "Please input player 1's name:"
      player_1.name = gets.chomp
      player_2 = Players::Human.new('O')
      puts "Please input player 2's name:"
      player_2.name = gets.chomp
    end

    # Chooses whether 'X' or 'O'

    puts "Is player 1 or player 2 first?"
    puts " Choose '1' for player 1 or '2' for player 2:"
    first_player = " "
    until first_player == "1" || first_player == "2"
      first_player = gets.chomp
      if first_player != "1" && first_player != "2"
        puts "1 or 2. Please! Try again:"
      end
    end

    if first_player == "1"
      first_player = player_1
      second_player = player_2
    else
      first_player =  player_2
      second_player = player_1
    end

    game = Game.new(first_player, second_player)

    game.play

    puts "Would you like to play again?"
    input = gets.chomp
    if input == "Y"
      start
    else
      puts "Thank you for playing. Goodbye!"
    end
  end

end
