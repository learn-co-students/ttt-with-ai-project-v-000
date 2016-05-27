require'pry'
class Game
  WIN_COMBINATIONS = [
                      [0,1,2],#Top Three
                      [3,4,5],#Middle Three
                      [6,7,8],#Bottom Three
                      [0,3,6],#L Vertical
                      [1,4,7],#M Vertical
                      [2,5,8],#R Vertical
                      [0,4,8],#L-R Diagonal
                      [6,4,2]#R-L Diagonal
                              ]
  attr_accessor :board, :player_1, :player_2

  def initialize(player1 = Player::Human.new("X"), player2 = Player::Human.new("O"), board = Board.new )
    @board = board
    @player_1 = player1
    @player_2 = player2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
      if board.turn_count == 9
        true
      else
        false
      end
      #self.board.full?
  end

  def won?
    if win_x.length == 0 && win_o.length == 0
      false
    else
      true
    end
  end

  def win_x
    WIN_COMBINATIONS.select do |a, b, c|
      board.cells[a] == "X" && board.cells[b] == "X" && board.cells[c] == "X"  
    end
  end

  def win_o
    WIN_COMBINATIONS.select do |a, b, c|
      board.cells[a] == "O" && board.cells[b] == "O" && board.cells[c] == "O"  
    end
  end

  def draw?
    win_x.length+win_o.length == 0 ? true : false
  end

  def winner
    if win_x.length > 0
      "X"
    elsif win_o.length > 0
      "O"
    else
      nil
    end
  end

  def turn
    "Where would you like to go player #{self.current_player.token}?"
    input = self.current_player.move(@board)
    board.valid_move?(input)
    if board.valid_move?(input) == false
      input = current_player.move(@board)
    end
    board.update(input,current_player)
  end

  def play
    #over? is returning true even though the turn count is only
    #receiving 1 input into the board
    # binding.pry
    until over? == true
      turn
    end
    # until self.over? do
    #   self.turn
    #   "William"
    # end
  end








end