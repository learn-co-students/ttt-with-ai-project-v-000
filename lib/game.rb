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
  
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1 
    @player_2 = player_2 
    @board = board
  end
  
  def current_player 
    if board.turns_left.odd?
      player_1
    else 
      player_2 
    end
  end
  
  def over?
    draw? || won?
  end
  
  def won? 
    WIN_COMBINATIONS.detect do |win_combo|
      board.cell_value(win_combo[0]) == board.cell_value(win_combo[1]) &&
      board.cell_value(win_combo[1]) == board.cell_value(win_combo[2]) &&
      board.cell_taken?(win_combo[0])
    end
  end
  
  def draw?
    board.full? && !won?
  end
  
  def winner 
    winning_combo = won?
    if winning_combo 
      @winner = board.cell_value(winning_combo[0])
    end
  end
  
  def turn 
    board.display
    player = current_player
    move = ask_for_move
    board.update(move, current_player)
    puts "#{player.token} moved #{move}"
  end
  
  def ask_for_move
    move = current_player.move(board) 
    if !board.valid_move?(move)
      ask_for_move
    end
    move
  end
  
  def play 
    while !over? 
      turn 
    end
    if won?
      # binding.pry
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
  
  
end