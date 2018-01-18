class CLI

#idea: make a win_impossible? method that will call Cats Game early for impossible to win games with empty spaces left

  def run
    puts "Hello and welcome to Tic-Tac-Toe!"
    game_type
  end

  def game_type
    player_number
    token
    layout
      if @players == "0"
        Game.new(Player::Computer.new(@first), Player::Computer.new(@second), Board.new).play
      elsif @players == "1"
        Game.new(Player::Human.new(@first), Player::Computer.new(@second), Board.new).play
      elsif @players == "2"
        Game.new(Player::Human.new(@first), Player::Human.new(@second), Board.new).play
      end
      new_game
  end

  def player_number
    puts "Please enter '0' for computer simulation, '1' for single player mode, or '2' for two player mode."
    @players = gets.strip
    until @players == "0" || @players == "1" || @players == "2"
      puts "Please enter '0' for computer simulation, '1' for single player mode, or '2' for two player mode."
      @players = gets.strip
    end
  end

  def token
    puts "Pick your token 'X' or 'O':"
    token = gets.strip
      if token.upcase == "X"
		    @first = token.upcase
    		@second = "O"
	    elsif token.upcase == "O"
		    @first = token.upcase
		    @second = "X"
      else
        @first = "X"
        @second = "O"
      end
	end

  def layout
    puts "Here is a board:"
    puts "1 | 2 | 3"
    puts "-----------"
    puts "4 | 5 | 6"
    puts "-----------"
    puts "7 | 8 | 9"
  end

  def new_game
    puts "Would you like to play again? 'yes' or 'no':"
    input = gets.strip
    until input.upcase == "YES" || input.upcase == "NO"
      puts "Sorry...would you like to play again?"
      input = gets.strip
    end
    if input.upcase == "YES"
      game_type
    elsif input.upcase == "NO"
      exit
    end
  end
end
