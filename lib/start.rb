class StartGame
  attr_accessor :game, :computer_token, :player_token

  def initialize
    set_player_number
  end

  def set_player_number
    puts "Okay, let's play some Tic-Tac-Toe.\nThe Triple T.\nHow many players we talking about here? One? Two? ZERO?!?!\nOr you can just quit."
    input = gets.chomp
    if input == "1" || /one/i === input 
      one_player_setup
    elsif input == "2" || /two/i === input
      two_player_setup
    elsif input == "0" || /zero/i === input
      zero_player_setup
    elsif /quit/i === input
      puts "quitter..."
      return
    else
      puts "Try again, bozo."
      set_player_number
    end
  end

  def token_setter(token)
    if /x/i === token 
      @player_token = "X"
    elsif /o/i === token
      @player_token = "O"
    elsif token == "0"
      puts "Uh, that's a zero.  I mean the letter.  Do you want the 'X' or the 'O'?"
      input = gets.chomp
      token_setter(input)
    else
      puts "Try again, mate. That's a wacky way to tic and tac and toe. Do the 'X' or do the 'O'..."
      input = gets.chomp
      token_setter(input)
    end
    @player_token
  end

  def computer_token_setter(other_token)
    if other_token == "X"
      @computer_token = "O"
    else
      @computer_token = "X"
  end
end

  def zero_player_setup
    x_counter = 0
    o_counter = 0
    draws = 0
    100.times do 
      game = Game.new(player_1 = Computer.new("X"), player_2 = Computer.new("O"))
      game.computer_play
      if game.x_win?
        x_counter += 1
      elsif game.o_win?
        o_counter += 1
      else
        draws +=1
      end 
    end
    puts "\n\nWHOO HOO!!!  I just played against myself 100 times!  And I'll tell you who won.\n\nWell, I did.\n\nObviously.\n\n"
    puts "I won with 'X' #{x_counter} times, I won with 'O' #{o_counter} times, and #{draws} times it was a draw."
    puts "Want to play again?"
    input = gets.chomp
    if /y/i === input || /yes/i === input
      StartGame.new
    else
      puts "Okay byeeeeee..."
      return
    end
  end

  def one_player_setup

    puts "So you go it alone.  Very well.  Are you going first or second?"
    player_number = gets.chomp
    puts "Okay, #{player_number} it is.  And do you want to be the 'X' or the 'O'?"
    @player_token = gets.chomp
    token_setter(player_token)
    computer_token_setter(player_token)
    if /first/i === player_number || /1+/ === player_number
      player_1 = Human.new(player_token)
      player_2 = Computer.new(computer_token)
    elsif /second/i === player_number || /2+/ === player_number
      player_2 = Human.new(player_token)
      player_1 = Computer.new(computer_token)
    end
    @game = Game.new(player_1, player_2)
    puts "Set the computer's skill level:\n\n(1) = Easy Peasy\n--OR--\n(2) = Grand Master Champ"
    level = gets.chomp
    if level == "1"
      game.play
    elsif level == "2"
      game.play_difficult
    else
      puts "You screwed that up so I'm setting it to easy this time."
      game.play
    end
        
  end

  def two_player_setup
    puts "You have a friend to play with you.  Very fancy.  Whomever is going first will be 'X' and the second player will be 'O'.  Let the games BEGIN!"
    game = Game.new
    game.play  
  end

        



end

        

    