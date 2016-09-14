class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"),
                 player_2 = Players::Human.new("O"),
                 board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def won?
    ["X","O"].any? do |player|
      WIN_COMBINATIONS.any? do |combo|
        combo.all? do |position|
          @board.cells[position] == player
        end
      end
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    ["X","O"].detect do |player|
      WIN_COMBINATIONS.any? do |combo|
        combo.all? do |position|
          @board.cells[position] == player
        end
      end
    end
  end

  def turn
     position = current_player.move(@board)
     
      while !@board.valid_move?(position)
        puts "Sorry, no dice"
        position = current_player.move(@board)
      end
      
      @board.update(position, current_player)
  end
  
  def play
    while !over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end    
  end
end
