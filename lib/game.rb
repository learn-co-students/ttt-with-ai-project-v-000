require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]]

  def initialize(player_1 = Human.new('X'), player_2 = Human.new('O'), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @reset_input
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position = { one: board.cells[win_combination[0]],
                   two:  board.cells[win_combination[1]],
                   three:  board.cells[win_combination[2]]}
 
      if position[:one] == 'X' && position[:two] == 'X' && position[:three] == 'X'
        return win_combination
      elsif position[:one] == 'O' && position[:two] == 'O' && position[:three] == 'O'
        return win_combination
      end
    end
    false
  end

  def draw?
    board.full? && !won? 
  end

  def winner
    if won? && board.cells[won?[0]] == player_1.token
      player_1.token
    elsif won? && board.cells[won?[0]] == player_2.token
      player_2.token
    end
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      puts 'Invalid move please select a valid position.'
      turn
    end
  end

  def play
    until over?
      puts "Choose a position 1-9:"
      turn
      board.display
    end
    if winner == player_1.token
      puts "Congratulations #{player_1.token}!"
    elsif winner == player_2.token
      puts "Congratulations #{player_2.token}!"
    elsif draw?
      puts "Cats Game!"
    end
    puts "Play again? (y/n)"
  end

  def start
    puts "Hello, welcome to Tic Tac Toe!"
    puts "Please select an amount of human players 0, 1 or 2."
    loop do
      input = gets.chomp
      case input.downcase
      when '0'
        create_two_computers
        play
        restart_game
        break
      when '1'
        player_1.token = get_token_choice
        comp_token = (self.player_1.token == 'O') ? 'X' : 'O'
        self.player_2 = Computer.new(comp_token)
        play
        restart_game
        break
      when '2'
        player_1.token = get_token_choice 
        comp_token = (self.player_1.token == 'O') ? 'X' : 'O'
        player_2.token = (comp_token)
        play
        restart_game
        break
      else
        puts "Hm, it might be tricky playing with that many people."
      end
    end
  end

  def get_token_choice
    puts "Choose your token. X or O? Choose wisely"
    input = gets.chomp.upcase
    if input == 'X'
      'X'
    elsif input == 'O'
      'O'
    else
      puts 'Not the right token, sorry'
      choose_your_token
    end
  end

  def create_two_computers
    tokens = ['X','O']
    self.player_1 = Computer.new(tokens.shuffle!.pop)
    self.player_2 = Computer.new(tokens.pop)
  end

  def restart_game
    reset_input = gets.chomp.downcase
    if reset_input == "y"
      board.reset!
      play
      restart_game
    elsif reset_input == "n"
      puts "See you later."
    else
      puts "What? try that again"
      restart_game
    end
  end

end
