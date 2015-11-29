require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [6,7,8], [3,4,5], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1=Human.new('X'), player_2 = Human.new('O'), board = Board.new)
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
    game = self
    board.display
     if current_player.class == Computer
      puts "I'm thinking!  Give me a sec!"
      sleep 1
    end
    begin
      input = current_player.move(game.board)
    end until board.valid_move?(input)
    system 'clear'
    board.update(input, current_player)
   
  end

  def play
    while !over?
      turn  
    end
    board.display
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end
end