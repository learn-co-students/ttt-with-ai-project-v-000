require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :last_turn
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

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
   @board = board
   @player_1 = player_1
   @player_2 = player_2
  end

  def ai_vs_ai
    @player_1 = Player::Computer.new("X")
    @player_2 = Player::Computer.new("O")
  end

  def ai_vs_human(choice) ## -->
    if  choice == "X"
      @player_2 = Player::Computer.new("O")
    else
      @player_1 = Player::Computer.new("X")
    end
  end

  def over?
   won? || draw?
  end

  def current_player
   @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def winner
   if winning_combo = won?
     @winner = @board.cells[winning_combo.first]
   end
  end

  def turn
   player = current_player
   puts "Where you like to move? Enter (1-9)"
   current_move = player.move(@board)
   if !@board.valid_move?(current_move)
     turn
   else
     puts "Turn: #{@board.turn_count+1}\n"
     @board.display
     @board.update(current_move, player)
     puts "#{player.token} moved #{current_move}"
     @board.display
     puts "\n\n"
   end
   @board.last_turn = current_move
  end

  def play
   while !over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cats Game!"
   end
  end

  def can_win?
    WIN_COMBINATIONS.detect do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]]
        if board.valid_move(combo[2])
          return combo[2]
        elsif @board.cells[combo[1]] == @board.cells[combo[2]]
          if board.valid_move(combo[0])
            return combo[0]
          elsif @board.cells[combo[0]] == @board.cells[combo[2]]
            board.valid_move(combo[1])
            return combo[1]
          end
        end
      end
    end
  end

  def won?
   WIN_COMBINATIONS.detect do |combo|
     @board.cells[combo[0]] == @board.cells[combo[1]] &&
     @board.cells[combo[1]] == @board.cells[combo[2]] &&
     @board.taken?(combo[0]+1)
   end
  end

  def draw?
   @board.full? && !won?
  end
end
