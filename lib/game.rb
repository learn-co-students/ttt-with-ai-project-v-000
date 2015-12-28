require_relative './game_status.rb'
class Game
  attr_accessor :player_1, :player_2 #:board

  include GameStatus
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    self.board.token_1 = self.player_1.token
    self.board.token_2 = self.player_2.token
  end
#---------------------------------------------------#

  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  # def won?
  #   WIN_COMBINATIONS.each do |combo|
  #     if (board.cells[combo[0]] != " ") && (board.cells[combo[0]] == board.cells[combo[1]]) && (board.cells[combo[1]] == board.cells[combo[2]])
  #       @winner = board.cells[combo[0]]
  #       return true
  #     end

  #   end
  #   if @winner == nil
  #     return false
  #   end
  # end

  # def draw?
  #       if !won?  && board.full? == true
  #           return true
  #       end
  #   end

  # def over?
  #   won? || draw?
  # end

  def winner
    won?
    @winner
  end

#---------------------------------------------------#

  def self.start
    puts 'Hello, Human!'
    puts 'Welcome to Tic Tac Toe!'
    puts 'How many humans will be playing today?'
    puts '1? 2? Or would you like to watch the computers battle it out?'

    number_of_humans = gets.strip

    case number_of_humans

    when '1'
      puts 'Would you like to go first?'
      go_first = gets.chomp

      puts "Puts would you like to be 'X' or 'O'?"

      human_token = gets.chomp.upcase

      if human_token == "X"
          computer_token = "O"
      else
          computer_token = "X"
      end

      if go_first == "yes"
        Game.new(Player::Human.new(human_token), Player::Computer.new(computer_token)).play
      else
        Game.new(Player::Computer.new(computer_token), Player::Human.new(human_token)).play
      end

    when '2'

      puts 'Player 1 would you like to be X or O?'

      player_1_token = gets.chomp.upcase

      if player_1_token == "X"
        player_2_token = "O"
      else
        player_2_token = "X"
      end

      Game.new(Player::Human.new(player_1_token), Player::Human.new(player_2_token)).play

    when '0'
      Game.new(Player::Computer.new('X'), Player::Computer.new('O')).play

    when 'wargames'
      100.times do
        Game.new(Player::Computer.new('X'), Player::Computer.new('O')).wargames
      end
    end
  end

  def wargames
    puts "This is wargames"


    victories = 0

    while !over?
      turn
    end

    victories += 1 if won?

    puts victories
  end

  def play
    while !over?
      turn
    end
    
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{@winner}!"
    end

    end_game
  end

  def turn
    board.display
    pick = current_player.move(board)
    if board.valid_move?(pick)
      board.update(pick, current_player)
    else
      puts "Invalid Move"
      turn
    end
  end

  def end_game
    puts "Would you like to play again?(y/n)"

    user_answer = gets.chomp

    if user_answer == "y"
      Game.start
    else
      puts "Thanks for playing. Goodbye."
    end
  end

end #Ends Game class
