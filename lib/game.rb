require_relative "./player.rb"
require_relative "./players/human.rb"


class Game
  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board

  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def turn_count
    turn=0
    board.cells.each do |index|
      if index=="X"|| index=="O"
        turn+=1
      end
    end
    turn
  end

  def current_player
    turn = self.turn_count
    if turn == 0
      @player_1
    elsif turn.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    board.cells.all? { |cell|  cell == "X" || cell == "O"}
  end

  def won?
    WIN_COMBINATIONS.detect { |win_array|
      index_1 = win_array[0]
      index_2 = win_array[1]
      index_3 = win_array[2]
      on_board_1 = board.cells[index_1]
      on_board_2 = board.cells[index_2]
      on_board_3 = board.cells[index_3]
      (on_board_1 == "X" && on_board_2 == "X" && on_board_3 == "X") || (on_board_1 == "O" && on_board_2 == "O" && on_board_3 == "O")
    }
  end

  def draw?
    self.over? && !(self.won?)
  end

  def winner
    if self.won?
      WIN_COMBINATIONS.each { |win_array|
        on_board_1 = board.cells[win_array[0]]
        on_board_2 = board.cells[win_array[1]]
        on_board_3 = board.cells[win_array[2]]
        if on_board_1 == "X" && on_board_2 == "X" && on_board_3 == "X"
          @winner = @player_1
        elsif on_board_1 == "O" && on_board_2 == "O" && on_board_3 == "O"
          @winner = @player_2
        end
      }
      @winner.token
    end
  end

  def turn
    player = self.current_player
    move = player.move(board).to_i
    if @board.valid_move?(move)
      @board.update(move,player)
    else
      puts "I dont think that's allowed... try again."
      self.turn
    end
    @board.display
  end

  def play
    while !(self.draw?) && !(self.won?)
      puts ""
      self.turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
