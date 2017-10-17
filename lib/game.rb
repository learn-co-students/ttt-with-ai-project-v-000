class Game
  attr_accessor :board, :player_1, :player_2, :turn, :current_player, :won_game  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @current_player = @player_1
    @board.display    
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    draw? || won?
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


  def winner
    winning_space = won?
    if winning_space
      @board.cells[winning_space[0]]
    end
  end

  def turn
    move = nil
    while !@board.valid_move?(move)
      move = current_player.move(@board)
    end
    puts "#{current_player.token} moves:"    
    @board.update(move, current_player)
    @current_player == @player_2 ? @current_player = @player_1 : @current_player = @player_2    
  end

  def play
    while !over?
      turn
      @board.display
    end

    if won?
      puts "Congratulations #{winner}!"
      @won_game = winner.to_s
      @board.display          
    elsif draw?
      @won_game = "draw"
      puts "Cat's Game!"
      @board.display
    end
  end


end
