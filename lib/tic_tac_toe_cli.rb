class TicTacToeCLI
  def initialize
  end


  puts %q[
    _____ _     _____         _____
   |_   _(_) ____   _|_ _  ____   _|__   ___
     | | | |/ __|| |/ _` |/ __|| |/ _ \ / _ \
     | | | | (__ | | (_| | (__ | | (_) |  __/
     |_| |_|\___||_|\__,_|\___||_|\___/ \___|
                                             ].green
  puts 'Hi! Welcome to the battlezone. Tic Tac Toe is the name of the game!'

  puts 'Please enter your name so that we can provide the best experience:'
  name = gets.chomp
  puts "Thanks #{name}! What kind of game would you like to play?"

  def call
    puts 'Enter 1 to play against the computer.'
    puts 'Enter 2 to play against a human.'
    puts 'Enter 00110011 to watch the computers battle to their circuits.'
    puts "WHISPERS 'or enter wargames if you want to have a good time'"
    puts "\nYou may also enter 'q' to Quit"
    game_type = gets.chomp
    first_move = ''

    if game_type == 'q'
      puts 'Hate to see you go. Have a nice day!'.green
      abort
    elsif game_type == '2' # hum vs hum
      Game.new.play
      puts "OMG that was fun, wasn't it, Player? Would you like to play another game?"
      merry_go_round
    elsif game_type == '00110011' # comp vs comp
      Game.new(Players::Computer.new('X'), Players::Computer.new('O'), Board.new).play
      puts "OMG that was fun, wasn't it? Would you like to play another game?"
      merry_go_round
    elsif game_type == 'wargames' # comp on comp crime for 100
      counter = 0
      until counter == 100
        counter += 1
        Game.new(Players::Computer.new('X'), Players::Computer.new('O')).play
        puts "OMG that was fun, wasn't it? Would you like to play another game?"
        merry_go_round
      end
    elsif game_type == '1' # hum vs comp
      puts "So umm...who's going first?!"
      puts "\nIf you want to go first, Player, choose 'X'. Otherwise, choose 'O'"
      first_move = gets.strip.upcase
      while first_move != 'X' && first_move != 'O'
        puts 'Cmon, son! What are you doing?! Enter X or O, please.'.red
        first_move = gets.strip.upcase
      end
    end

    game = nil
    if first_move == 'X'
      Game.new(Players::Human.new('X'), Players::Computer.new('O'), Board.new).play
    else
      Game.new(Players::Computer.new('X'), Players::Human.new('O'), Board.new).play
    end
    puts "OMG that was fun, wasn't it? Would you like to play another game?"
    merry_go_round
  end

  def merry_go_round
    input = gets.chomp
    while input != 'Y' || input != 'N'
      puts "Please enter 'Y' or 'N'.".red
    case input
    when 'Y'
      call
    when 'N'
      puts 'Aww man! Ok. See you later!'
      abort
    else
      merry_go_round
      end
    end
  end
end
