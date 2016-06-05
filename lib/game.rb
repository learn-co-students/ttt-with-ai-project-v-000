class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] ==  @board.cells[combo[1]] &&
      @board.cells[combo[2]] ==  @board.cells[combo[0]] &&
      @board.taken?(combo[2]+1)
    end
  end

  def draw?
    !won? && @board.turn_count == 9
  end

  def winner
    if win_combo = won?
      @winner = @board.cells[win_combo[0]]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

  def start
  end

  def play_again
    puts "Do you want to play this game again?"
    puts "If you want, please input yes. If you don't, please input no."
    play_again = ""
    play_again = gets.strip
    until play_again.downcase == "no"
      play_again.downcase == "yes"
      puts "What kind of game do you want to play? You can select a mode 0 player, 1 player and 2 players."
      puts "Please input 0-2."
      input = ""
      input = gets.strip

      if input.to_i == 2
        puts "You will start #{input.to_i} player mode game. player_1 should go first and player_1's token will be X."
        game = Game.new
        until won?
          play
        end
        play_again
      elsif input.to_i == 1
        puts "You will start #{input.to_i} player mode game. You should go first and your token will be X."
        game = Game.new(player_1 = Player::Human.new("X"), player_2 = Player::Computer.new("O"))
        until won?
          play
        end
        play_again
      elsif input.to_i == 0
        game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Computer.new("O"))
        until won?
          play
        end
        play_again
      else
        puts "Please input 0-2."
      end
    end
  end
end
