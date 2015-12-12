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

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    player_1.board = self.board
    player_2.board = self.board
    player_1.game = self
    player_2.game = self
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

  def start

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











end #Ends Game class