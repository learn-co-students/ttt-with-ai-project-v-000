class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board
    @board
  end

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

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.each do |combos|
      if @board.cells[combos[0]]=="X" && @board.cells[combos[1]]=="X" && @board.cells[combos[2]]=="X" || @board.cells[combos[0]]=="O" && @board.cells[combos[1]]=="O" && @board.cells[combos[2]]=="O"
        return true
      end
    end
    return false
  end

  def winner
     WIN_COMBINATIONS.each do |combos|
      if @board.cells[combos[0]]=="X" && @board.cells[combos[1]]=="X" && @board.cells[combos[2]]=="X"
        return "X"
      elsif @board.cells[combos[0]]=="O" && @board.cells[combos[1]]=="O" && @board.cells[combos[2]]=="O"
        return "O"
      end
    end
    return nil
  end

  def turn
    #puts "Please enter from 1-9"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      input
    else
      board.display
      puts "This spot is already taken."
      turn
    end
  end

  def play
    until over?
      board.display
      turn
    end
    board.display
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?

    puts "Would you like to play again? y or n"
    input = gets.chomp.strip
    if input == "y"
      puts "Please enter 0, 1 or 2 for number of human players."
      input = gets.chomp.to_i
      Game.new.player_count(input)
    elsif input == "n"
      puts "Thanks for playing!"
    end
  end

  def player_count(players)
    case players
      when 0
        game_type = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
      when 1
        puts "Do you want to go first? y or n"
        who_goes = gets.chomp.strip
        if who_goes == "y"
          game_type = Game.new(Player::Human.new("X"), Player::Computer.new("O"))
        elsif who_goes == "n"
          game_type = Game.new(Player::Computer.new("X"), Player::Human.new("O"))
        end
      when 2
        game_type = Game.new(Player::Human.new("X"), Player::Human.new("O"))
    end
    game_type.play
  end

end