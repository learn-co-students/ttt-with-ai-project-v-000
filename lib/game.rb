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
    @board.display
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
    puts "Please enter 1-9:"
    answer = current_player.move(current_player.token)
    if @board.valid_move?(answer)
      @board.update(answer, current_player)
      @board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
    exit
  end

  def exit
    farewell = ["Goodbye!", "Thanks for playing!", "Come back soon!", "It's okay if you didn't win, at least you had fun!"]
    puts "Would you like to play again? (y/n)"
    input = gets.strip
    if input == 'y'
<<<<<<< Updated upstream
      self.board.reset!
      play
    elsif input == 'n'
      abort(farewell.sample)
    else
=======
      @board.reset!
      puts "Select number of human players: (0-2)"
      input = gets.strip
      if input == "2"
        puts "First player make your move!"
        g = Game.new
        g.play
        g.exit
      elsif input == "1"
        puts "Who will go first? \n Choose 1 for Computer \n Choose 2 for Human"
        first_player = gets.strip
        if first_player == "1"
          g = Game.new(Computer.new("X", true))
          g.play
          g.exit
        elsif first_player == "2"
          g = Game.new(Human.new("X"), Computer.new("O", true))
          g.play
          g.exit
        end    
      elsif input == "0"
        g = Game.new(Computer.new("X", true), Computer.new("O", true))
        g.play
        g.exit
      end
      play
      exit
    elsif input == 'n'
      farewell = ["Goodbye!", "See you later!", "Thanks for playing!", "Come back soon!", "Hope you had fun!", "It's okay if you didn't win, at least you had fun!"]
      abort(farewell.sample)
    else
      puts "Try choosing from the options next time."
>>>>>>> Stashed changes
      exit
    end
  end

<<<<<<< Updated upstream
  def game_type

=======
>>>>>>> Stashed changes
end

 
