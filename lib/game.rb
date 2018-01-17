class Game
  attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

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

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? != false || draw? == true ? true : false
  end

  def won?
    WIN_COMBINATIONS.each do |win| #iterating over the WIN COMBINATIONS constant... if any winning-combo array is all X or O, but not "", you win!
      if @board.cells[win[0]] == @board.cells[win[1]] &&
        @board.cells[win[1]] == @board.cells[win[2]] && @board.cells[win[0]] != " "
      return win
      end
    end
    false
  end


  def draw?
    @board.full? && !won? ? true : false
  end


  def winner
    won_return = won?
    if won_return
      @board.cells[won_return.first]
    end
  end

  def turn
    move = current_player.move(@board)
    if !@board.valid_move?(move)
      puts "Invalid selection."
      turn
    else
      @board.update(move,current_player)
      puts "// TIC TAC TOE //"
      board.display
      puts ""
      puts ""
      puts ""
    end
  end

  def play
    if !over?
      turn
      play
    elsif draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    self.board.display
    self.play
    puts ""
    puts ""
    puts ""
  end
end
