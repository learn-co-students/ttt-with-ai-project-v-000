require_relative './players/human.rb'
require_relative './board.rb'
require_relative './player.rb'

class Game
  attr_accessor :board, :player_1, :player_2
  include GameCheck

  @@wargames_won = 0

  def initialize(player_1=Human.new('X'), player_2=Human.new('O'), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn
    if current_player == player_1 
      puts 'Player 1, your move!'
    else 
      puts 'Player 2, your move!'
    end
    puts "Where do you want to move? Enter an empty space from 1-9."
    board.display
    choice = current_player.move(board).to_i
    while board.valid_move?(choice) == false 
      choice = current_player.move(board).to_i
    end
    board.update(choice, current_player)
  end

  def play  
    while over? == false
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
      board.display
      @@wargames_won += 1
    else
      puts "Cats Game!"
      board.display
    end
  end

  def choose_players
    players = gets.chomp
    while players != '0' && players != '1' && players != '2' && players != 'wargames'
      puts "Please enter 0, 1, or 2." 
      players = gets.chomp
    end
    if players == '2'
      return two_player
    elsif players == '1'
      return one_player
    elsif players == '0'
      return zero_players
    elsif players == 'wargames'
      return 'wargames'
    end
  end

  def two_player
    puts "Player 1, hit any key and press enter."
    gets
    puts "You are 'X', and will go first! Player 2 is 'O'."
    Game.new
  end

  def one_player
    puts "You are playing the computer! Who do you want to go first?"
    puts "Type 'me' or 'computer' :"
    choice = gets.chomp
    while choice != 'me' && choice != 'computer'
      puts "Type 'me' or 'computer' :"
      choice = gets.chomp
    end      
    if choice == 'me'
      puts "You are player 1, 'X'"
     return Game.new(player_1=Human.new('X'), player_2=Computer.new('O'))
    else
      puts "You are player 2, 'O'"
      return Game.new(player_2=Computer.new('X'), player_2=Human.new('O'))
    end
  end

  def zero_players
    puts "The computer will play itself... enjoy!"
    Game.new(player_1=Computer.new('X'), player_2=Computer.new('O'))
  end


  def start
    puts "Welcome to Tic Tac Toe with AI. How many players?(0, 1, or 2)"
    new_game = choose_players
    if new_game == 'wargames'
      100.times do
        zero_players.play
      end
      puts "The game was won #{@@wargames_won} times!"
    else
      new_game.play
    end
  end

end


