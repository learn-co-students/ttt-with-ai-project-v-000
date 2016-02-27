class Game
  attr_accessor :board, :player_1, :player_2, :winner

    WIN_COMBINATIONS = [[0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [6,4,2]]
  def initialize(player_1=nil, player_2=nil, board=nil)
    @board = board || Board.new()
    @player_1 = player_1 || Human.new("X")
    @player_2 = player_2 || Human.new("O")
    @winner = nil
  end

  def current_player
    return @board.turn_count%2 == 0 ? @player_1 : @player_2
  end

  def over?
    if won?
      return true
    elsif draw?
      return true
    else
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |triplet|
      if triplet.all?{|s| @board.cells[s]=="O"}
        @winner = "O"
        return true
      elsif triplet.all?{|s| @board.cells[s]=="X"}
        @winner = "X"
        return true
      end
    end
    return false
  end

  def winner
    won?
    return @winner
  end

  def draw?
    if !self.won? && @board.full?
      return true
    end
    return false
  end

  def turn
    if current_player.is_a?(Human)
      puts "Please enter 1-9:"
    end
    answer = current_player.move(current_player.token)
    if @board.valid_move?(answer)
      @board.update(answer, current_player)
      @board.display
      puts "\n"
      if current_player.is_a?(Computer)
        puts "Computer's move: "
      end
    else
      turn
    end
  end

  def play
    #don't print out a board if the computer plays first vs human
    if @board.turn_count==0 && current_player.is_a?(Computer)
      #nothing happens
    else
      @board.display
    end
    #play the game until it's over
    until over?
      turn
    end
    #state the ending
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

  def exit
    puts "Would you like to play again? (y/n)"
    input = gets.strip
    if input == 'y'
      @board.reset!
      play
      exit
    else
      farewell = ["Goodbye!", "Thanks for playing!", "Come back soon!", "It's okay if you didn't win, at least you had fun!"]
      abort(farewell.sample)
    end
  end

  def game_type
  end

end
