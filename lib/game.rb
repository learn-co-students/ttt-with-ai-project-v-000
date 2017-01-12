class Game
  attr_accessor :player_1, :player_2, :board

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

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    return @player_1 if board.turn_count.even?
    return @player_2 if board.turn_count.odd?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if board.cells[win_combo[0]] == 'X' && board.cells[win_combo[1]] == 'X' && board.cells[win_combo[2]] == 'X'
        return true
      elsif board.cells[win_combo[0]] == 'O' && board.cells[win_combo[1]] == 'O' && board.cells[win_combo[2]] == 'O'
        return true
      end
    end
    return false
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    WIN_COMBINATIONS.each do |win_combo|
      if board.cells[win_combo[0]] == 'X' && board.cells[win_combo[1]] == 'X' && board.cells[win_combo[2]] == 'X'
        return 'X'
      elsif board.cells[win_combo[0]] == 'O' && board.cells[win_combo[1]] == 'O' && board.cells[win_combo[2]] == 'O'
        return 'O'
      end
    end
    return nil
  end

  def turn
    player = current_player
    current_move = player.move(@board)

    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved to position #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  def play
    while !over?
      turn
    end
    
    if self.won? 
      puts "Congratulations #{self.winner}!"
    elsif self.draw? 
      puts "Cat's Game!"
    end
  end
end