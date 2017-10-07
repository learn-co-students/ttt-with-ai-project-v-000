class Game
  attr_accessor :board, :player_1, :player_2 

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  
  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all? {|a| @board.cells[a] == "O"}
        winner = "O"
        return combination
      elsif combination.all? {|a| @board.cells[a] == "X"}
        winner = "X"
        return combination
      end
    end
    false
  end

  def over? 
    draw? || won?
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    move = current_player.move(@board)   
    if @board.valid_move?(move)
      @board.update(move, current_player)
    else 
      turn
    end
    @board.display
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
  
end



