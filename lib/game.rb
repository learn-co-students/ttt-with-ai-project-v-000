class Game
  attr_accessor :board, :player_1, :player_2, :winner
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @winner = " "
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def turn
    move = current_player.move(board)
    if !board.valid_move?(move)
      puts "Hmm, that position isn't valid." if current_player.class == Players::Human
      turn
    else
      puts "COMPUTER MOVES TO UNOCCUPIED SPACE #{move}." if current_player.class == Players::Computer
      board.update(move, current_player)
      board.display
    end
  end

  def play
     until over?
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat's Game!"
     end
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.any?{|combo| check(combo) == true}
  end

  def draw?
    !won? && board.full?
  end

   def winner
    if won?
      a = board.cells.count{|a| a == player_1.token}
      b = board.cells.count{|b| b == player_2.token}
      if a > b
        player_1.token
      elsif b > a
        player_2.token
      elsif b == a
        current_player.token == "X" ? "O" : "X"
      end
    end
  end

  def check(combo)
    board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
  end


end
