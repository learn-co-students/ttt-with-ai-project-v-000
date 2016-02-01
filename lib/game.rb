class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  attr_accessor :player_1, :player_2, :board
  attr_reader :winner

  def initialize(player_1 = Human.new('X'), player_2 = Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2 
  end

  def over?
    (@board.full? || won? || draw?) ? true : false
  end

  def won?
    WIN_COMBINATIONS.each do |combination| 
      if @board.get_cells(combination).uniq.length == 1
        token = @board.cells[combination[0]]
        if (token == "X") || (token == "O")
          @winner = token
          return true
        end
      end
    end
    false
  end

  def draw?
    return true if @board.full? && (self.won? == false)
    false
  end

  def winner
    self.won?
    @winner == " " ? nil : @winner
  end

  def turn
    loop do
      puts "It's player #{current_player.token}'s move"
      move = current_player.move(board)
      if @board.valid_move?(move)
        @board.update(move, current_player)
        break
      end
      puts "Invalid move.  Please try again."
    end
  end

  def play
    turn until self.over?
    puts "Congratulations #{@winner}!" if @winner
    puts "Cats Game!" if draw?
    @board.display
  end

end
