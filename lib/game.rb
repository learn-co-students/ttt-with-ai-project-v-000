require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [6,7,8], [3,4,5], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1= Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    return player_1 if board.turn_count % 2 == 0
    return player_2 if board.turn_count % 2 != 0
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all? { |position| board.cells[position] == 'X'}
      return combo if combo.all? { |position| board.cells[position] == 'O'}
    end
    false
  end

  def draw?
    board.full? && !won?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    puts "It's #{current_player.token}'s turn"
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
      board.display
    else
      puts "Try again boss"
      self.turn
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

  def self.begin

    puts "Welcome to Tic Tac Toe!"
    puts "How many players?"

    players = gets.strip

    if players == "0"
      game = Game.new(Players::Computer.new("x"), Players::Computer.new("O")).play
    elsif players == "1"
      puts "Who goes first, player or computer? Type it in"
      input = gets.strip

      if input == "player"
        game = Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      elsif input == "computer"
        game = Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
      else
        puts "Invalid response, please try again."
      end
    end
  end

end
