class Game

  attr_accessor :board, :player_1, :player_2, :winner

  WIN_COMBINATIONS = [0,1,2],
                     [3,4,5],
                     [6,7,8],
                     [0,3,6],
                     [1,4,7],
                     [2,5,8],
                     [0,4,8],
                     [6,4,2]

  def initialize (player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @board.display
    @winner = winner
  end

  def start
    puts "Welcome to TTT with AI!"
    play
    @board.display
  end

  def current_player
    @board.turn_count%2 == 0 ? @player_1 : @player_2
  end

  def over?
    @board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all?{|p|@board.cells[p] == "O"}
        @winner = "O"
        return true
      elsif combo.all?{|p|@board.cells[p] == "X"}
        @winner = "X"
        return true
      end
    end
    return false
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    won?
    return @winner
  end

  def turn
    reply = current_player.move(board)
    if board.valid_move?(reply)
      board.update(reply, current_player)
      board.display
    else
      turn
    end
  end

  def play
    until over?
      self.turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
