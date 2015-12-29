class Game
  attr_accessor :player_1, :player_2, :board
  
  #Class constant, defines all winning combinations
  WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

  #initializes Game instance with a board and two players
  #Defaults to an empty board and two human players
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"),board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  #Determines current player for turn
  #returns player object
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  #determines if game is won by cross checking with constant
  #returns true/false
  def won?
    WIN_COMBINATIONS.any? do |combo|
       @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
    end
  end

  #uses #won? and @board.full to determine is game is over
  #returns true/false
  def over?
    won? || draw?
  end

  #uses #won? and @board.full to determine if game is a draw
  #returns true/false value
  def draw?
    !won? && @board.full?
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
        return @board.cells[combo[0]]
      end
    end
    return nil
  end

  def turn
    player = current_player
    flag = false
    while flag == false do
      input = player.move(@board)
      flag = @board.valid_move?(input)
      @board.update(input,player) if flag == true
      puts "Not a valid move. Please chose another location" if flag == false
    end
  end

  def play
    while over? != true do
      turn
      @board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end
end