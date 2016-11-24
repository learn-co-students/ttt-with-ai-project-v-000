class Game
  WIN_COMBINATIONS = [
  #rows
    [0,1,2],
    [3,4,5],
    [6,7,8],
  #columns
    [0,3,6],
    [1,4,7],
    [2,5,8],
  #diagonals
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2
  attr_reader   :current_player

  def initialize(player_1=Players::Human.new('X'), player_2=Players::Human.new('O'), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @current_player = @player_1
  end

  def draw?
    return true  if  @board.full? && !won?
    return false if !@board.full? && !won?
    return false if won?
  end

  def over?
    return true if draw? || @board.full? || won?
    false
  end

  def play
    puts ''
    @board.display
    while !over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts 'Cats Game!'
    end
  end

  def turn
    valid_input = false
    while !valid_input
      board_location = @current_player.move(@board)
      if (@board.valid_move?(board_location))
        @board.move(board_location, @current_player)
        @board.display
        @current_player = (@current_player == player_1 ? @player_2 : @player_1)
        valid_input = true
      else
        puts 'Invalid input'
      end
    end
  end

  def winner
    combo = won?
    @board.position(combo[0]+1) if combo
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (@board.taken?(combo[0]+1)) && (@board.position(combo[0]+1)==@board.position(combo[1]+1)) && (@board.position(combo[1]+1)==@board.position(combo[2]+1))
        return combo
      end
    end
    false
  end
end
