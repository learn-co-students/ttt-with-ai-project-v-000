class Game

attr_accessor :board, :player_1, :player_2, :token


  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def over?
    return true if draw? || won?
  end

  def won?
    WIN_COMBINATIONS.any? {|win| win.all? {|pos| board.cells[pos] == "X"} || win.all? {|pos| board.cells[pos] == "O"}}
  end

  def draw?
    board.full? == true && won? == false ? true:false
  end

  def winner
    if won? == true && current_player == player_1
      return player_2.token
    elsif won? == true && current_player == player_2
      return player_1.token
      end
  end

  def turn
    player = current_player
    pos = current_player.move(@board)
      if board.valid_move?(pos) == true
          board.update(pos, player)
          board.display
          puts "#{board.turn_count}"
      else board.valid_move?(pos) == false
          puts "invalid"
          turn
      end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "Would you like to play 0, 1, or 2 player mode?:"
    player_mode = gets.strip

    if player_mode == "0"
      @player_1 = Player::Computer.new("X")
      @player_2 = Player::Computer.new("O")
      play

    elsif player_mode == "1"
      puts "Please type '1' if you would like to be player 1 and 'X' or type '2' if you would like to be player 2 and 'O':"
      player = gets.strip
        if player == "1"
          @player_1 = Player::Human.new("X")
          @player_2 = Player::Computer.new("O")
          play
        else
          @player_1 = Player::Computer.new("X")
          @player_2 = Player::Human.new("O")
          play
        end
    elsif player_mode == "2"
      @player_1 = Player::Human.new("X")
      @player_2 = Player::Human.new("O")
      play
    else
      puts "invalid"
    end
    play_again
end

def play_again
  puts "Would you like to play again? Y/N:"
  play_again = gets.strip
    if play_again == "Y"
      board.reset!
      start
    else
      puts "Goodbye!"
    end
end

end
