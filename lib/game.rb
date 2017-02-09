require 'pry'
class Game
 
attr_accessor :board, :player_1, :player_2, :token


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end# of initialize

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]
]

  
  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2 
  end# of current_player


  def over?
    # a game is over if the game is either a draw or someone won
    won? || draw? 
  end# of over?


  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] &&
      (board.cells[combo[0]] == "X" || board.cells[combo[0]] == "O")
    end# of do 
  end# of won? 


  def draw?
    board.full? && !won?
  end# of draw 


  def winner
    # binding.pry
    if won?
      board.cells[won?[0]]
    end
  end# of winner 


  def turn
    move = current_player.move 

    if board.valid_move?(move)  
      puts "#{current_player.token} takes cell #{move}."
      @board.update(move, current_player)
      @board.display

    else 
      turn
    end# of if


  end# of turn 


  def play
    
    until over?
      turn
    end# of over?

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end# of if  

  end# of play 


end# of class
