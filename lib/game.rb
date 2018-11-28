class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    if player_1.instance_of? Players::Computer
      player_1.instance_variable_set(:@game, self)
      #player_1.instance_variable_set(:@board, board)
    elsif player_2.instance_of? Players::Computer
      player_2.instance_variable_set(:@game, self)
      #player_2.instance_variable_set(:@board, board)
    end
  end
  
  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end
  
  def won?
    if WIN_COMBINATIONS.detect{|c|
      (board.cells[c[0]] == "X" && board.cells[c[1]] == "X" && board.cells[c[2]] == "X") || (board.cells[c[0]] == "O" && board.cells[c[1]] == "O" && board.cells[c[2]] == "O")}.nil?
      false
    else
      WIN_COMBINATIONS.detect{|c|
      (board.cells[c[0]] == "X" && board.cells[c[1]] == "X" && board.cells[c[2]] == "X") || (board.cells[c[0]] == "O" && board.cells[c[1]] == "O" && board.cells[c[2]] == "O")}
    end
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    draw? || board.full? || won?
  end
  
  def winner
    if won?
      if board.cells.count {|position| position == "X"} > board.cells.count {|position| position == "O"} then "X"
      else "O"
      end
    end
  end
  
  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end
  
  def start
    
  end
  
  def play
    board.display
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  
########Computer Methods##########

  def opposing_player
    if current_player == player_1
      player_2
    else
      player_1
    end
  end


  def almost_won?
    if over?
      false
    else
      WIN_COMBINATIONS.shuffle.detect do |c|
        t = current_player.token
        (board.cells[c[0]] == t && board.cells[c[1]] == t) || (board.cells[c[1]] == t && board.cells[c[2]] == t) || (board.cells[c[0]] == t && board.cells[c[2]] == t)
      end
    end
  end
  
  def almost_lost?
    if over?
      false
    else
      WIN_COMBINATIONS.shuffle.detect do |c|
        t = opposing_player.token
        (board.cells[c[0]] == t && board.cells[c[1]] == t) || (board.cells[c[1]] == t && board.cells[c[2]] == t) || (board.cells[c[0]] == t && board.cells[c[2]] == t)
      end
    end
  end
  
  def early?
    if over? || almost_won?
      false
    else
      WIN_COMBINATIONS.shuffle.detect do |c|
        board.cells[c[0]] == current_player.token || board.cells[c[1]] == current_player.token || board.cells[c[2]] == current_player.token
      end
    end
  end

  
end