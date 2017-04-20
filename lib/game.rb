require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],#top
    [3, 4, 5],#mid
    [6, 7, 8],#bot
    [0, 3, 6],#left vert
    [1, 4, 7],#mid vert
    [2, 5, 8],#right vert
    [0, 4, 8],#slash1
    [2, 4, 6]#slash2
  ]

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won?
      combo = won?
      @winner = board.cells[combo.first]
    end
  end


  def turn
    puts "It's #{current_player.token}'s turn"
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
      board.display
    else
      puts "Try again boss"
      self.turn
    end
  end


=begin
  def turn
    player = current_player
    current_move = player.move(@board)
      if !@board.valid_move?(current_move)
        turn
      else
        puts "Current Turn: #{@board.turn_count + 1} \n"
        @board.display
        @board.update(current_move, player)
        puts "#{player.token} moved #{current_move}"
        @board.display
        puts "\n\n"
      end
  end
=end



  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
      play_again?
    end
  end


  def play_again?
    puts "Would you like to play again?  Press Y or N (for Yes, I would like to play this most excellent game of
    Tic Tac Toe again, or for No, I would not like to play this most excellent game of Tic Taco Toe again)."

    input = gets.strip

    if input == "Y" || input == "y"
      game = Game.new
      until game.won?
        game.play
      end
    elsif input == "N" || input == "n"
      puts "Oh geez, too bad. Maybe try again harder next time boss."
    else
      puts "That's not a viable answer."

      play_again?
    end
  end


end
