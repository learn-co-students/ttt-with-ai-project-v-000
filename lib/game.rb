class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.odd? ? @player_2 : @player_1
  end

  def over?
    won? || draw? 
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combinations|
      @board.cells[win_combinations[0]] == @board.cells[win_combinations[1]] &&
      @board.cells[win_combinations[1]] == @board.cells[win_combinations[2]] &&   
      @board.taken?(win_combinations[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won? 
      @board.cells[won?[0]] 
    end
  end

  def turn
    puts "#{current_player.token} your move."
    input = current_player.move(@board)
    if !@board.valid_move?(input)
      turn
    else
      @board.update(input, current_player)
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
    end
  end

end