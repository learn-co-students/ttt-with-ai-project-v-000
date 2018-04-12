class Game

attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
[0, 1, 2], [3, 4, 5],
[6, 7, 8], [0, 4, 8],
[2, 4, 6], [0, 3, 6],
[2, 5, 8], [1, 4, 7],
]

def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def menu
  user_input = ""

  while while user_input != "exit"
    puts "Welcome to Tic Tac Toe!"
    puts "Choose your game:"
    puts "1. One person game"
    puts "2. Two person game"
    puts "3. Computer vs Computer game"
    puts "type exit to exit"

    user_input = gets.chomp.downcase
    case user_input
    when "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
      board = Board.new
      new_game = Game.new(player_1, player_2, board)
      play
    when "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
      board = Board.new
      new_game = Game.new(player_1, player_2, board)
      play
    when "3"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      board = Board.new
      new_game = Game.new(player_1, player_2, board)
      play
    end
  end
end
end

def current_player
  board.turn_count.even? ? @player_1 : @player_2
end

def won?
  WIN_COMBINATIONS.detect { |win_combination|
    @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
    @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
    @board.taken?(win_combination[0]+1)}

  end

  def draw?
  @board.full? && !won?
  end

  def over?
    @board.full? || won? || draw?
  end

  def winner
    if WIN_COMBINATIONS.any? {|array| array.all? {|cell| self.board.cells[cell] == "X"}}
            "X"
    elsif WIN_COMBINATIONS.any? {|array| array.all? {|cell| self.board.cells[cell] == "O"}}
            "O"
    else
          nil
    end
  end

  def turn
    user_input = current_player.move(board)
    if !board.valid_move?(user_input)
      turn
    end
    board.update(user_input, current_player)
    board
  end

  def play
    until self.over?
      turn
    end
    if self.won?
      puts "Congratulations #{winner}!"
      board.reset!
    elsif self.draw?
      puts "Cat's Game!"
      board.reset!
    end
  end

end
