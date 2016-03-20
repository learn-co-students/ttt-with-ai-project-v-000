class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    #horizontal combos
    [0,1,2], 
    [3,4,5],
    [6,7,8], 
    #verical combos
    [0,3,6], 
    [1,4,7], 
    [2,5,8],
    #diagonal combos
    [2,4,6],
    [0,4,8]
]
  
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1 
    @player_2 = player_2 
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    draw? || won? 
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && 
      @board.cells[combo[0]] == @board.cells[combo[2]] && 
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    #had to make designate this new variable bc without it current_player.token was returning the opposite token.
    current = current_player
    current_move = current_player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, current_player)
      @board.display
      puts ""
      puts "Player #{current.token} made a move."
      puts ""
    else 
      turn
    end
  end

  def play
    while !over?
      turn
      sleep(0.5)
    end
    if won?
      puts "Congratulations #{winner}!"
      puts ""
    elsif draw?
      puts "Cats Game!"
      puts " "
    end
  end

  def numbered_board
    puts "Numbers 1-9 refer to a position on the board."
    puts ""
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts ""
end
  
end