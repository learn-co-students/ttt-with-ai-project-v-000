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
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      # load the value of board at specified index
      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

      if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
        return win_combination
      elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
        return win_combination
      end
    end
    false
    #WIN_COMBINATIONS.detect do |combo|
    #  board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == board.cells[combo[2]]
    #end
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
      turn
    end
  end


  def play
    until over?
      turn
      board.display
    end
    if winner == player_1.token
      puts 'Congratulations X!'
    elsif winner == player_2.token
      puts 'Congratulations O!'
    elsif draw?
      puts "Cats Game!"
    end
  end

  def start
    puts "Hello, welcome to Tic Tac Toe!"
    puts "Please select an amount of human players 0, 1 or 2."
    while (input = gets.chomp) != 'exit'
      case input.downcase
      when '0'
        tokens = ['X','O']
        self.player_1 = Player::Computer.new(tokens.shuffle!.pop)
        self.player_2 = Player::Computer.new(tokens.pop)
        #binding.pry
        play
        # players play until the game is over and
        # it says who won or if its a draw
      when '1'
        # ask who will go first player_1 can be x or o
        # 1 player game plays against one computer
        # plays until the game is over and
        # it says who won or if it's a draw
        #
      when '2'
      end
    end
  end
end
