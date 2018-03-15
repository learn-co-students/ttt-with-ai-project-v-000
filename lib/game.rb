class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [2,5,8],
    [1,4,7],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.taken?(combo[0]+1) &&
      (@board.cells[combo[0]] == @board.cells[combo[1]]) &&
      (@board.cells[combo[0]] == @board.cells[combo[2]])
    end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    # #won? returns winning combination as array
    # somehow pull the value of index 0 from that array, and have that match the index number of @board.cells
    if !won?
      nil
    elsif won? != false
      @board.cells[won?[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    #current_player = player instance
    input = current_player.move(board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      turn
    end
  end

  def play
    until over? || won? || draw?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def play_again
    puts "Would you like to play again? y/n:"
      response = gets.strip
    if response == "n"
      puts "Thanks for playing!"
    elsif response == "y"
      puts "Please select the number of players: 0, 1, or 2:"
      answer = gets.strip
        until answer == "0" || answer == "1" || answer == "2"
          puts "Please select the number of players: 0, 1, or 2:"
        end
        if answer == "0"
          game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
          game.play
        else
          puts "Who should go first and be token X? Please enter 'me' or 'friend' or 'computer':"
          reply = gets.strip
          until reply == "me" || reply == "friend" || reply == "computer"
            puts "Who should go first and be token X? Please enter 'me' or 'friend' or 'computer':"
          end
          if (reply == "me" || reply == "friend") && answer == "2"
            game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
          elsif reply == "me" && answer == "1"
            game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
          elsif reply == "computer" && answer == "1"
            game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
          end
        game.play
        end
        game.play_again
    end
  end

  def start
    puts "Please select the number of players: 0, 1, or 2:"
    answer = gets.strip
      until answer == "0" || answer == "1" || answer == "2"
        puts "Please select the number of players: 0, 1, or 2:"
      end
      if answer == "0"
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        play
      else
        puts "Who should go first and be token X? Please enter 'me' or 'friend' or 'computer':"
        reply = gets.strip
        until reply == "me" || reply == "friend" || reply == "computer"
          puts "Who should go first and be token X? Please enter 'me' or 'friend' or 'computer':"
        end
        if (reply == "me" || reply == "friend") && answer == "2"
          game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        elsif reply == "me" && answer == "1"
          game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        elsif reply == "computer" && answer == "1"
          game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        end
        play
        end

    over?
      puts "Would you like to play again? y/n:"
      response = gets.strip
      if response == "n"
        puts "Thanks for playing!"
      elsif response == "y"
        start
      end
    end



end
