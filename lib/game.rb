# require 'pry'
#
# require_relative './players/human.rb'
# require_relative './player.rb'
# require_relative './board.rb'
# require_relative './players/computer.rb'

class Game

  attr_accessor :board, :player_1, :player_2, :current_player

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    elsif self.board.turn_count.odd?
      self.player_2
    end
  end

  def over?
    self.board.cells.none?{|cell| cell == " "}
  end

  def win_line
    # do i need to check here if the game is over?
    board_combinations = WIN_COMBINATIONS.collect do |win_array|
      win_array.collect {|index| self.board.cells[index]}
    end # at this point I expect board_combinations to resemble [["O", "X", "O"], ["X", "X", "O"], ["O","X", "O"] ... ]
    board_combinations.detect do |line|
      line.all?{|space| space == "O"} || line.all?{|space| space == "X"}
    end # win_line should at this point look like ["X", "X", "X"] OR ["O", "O", "O"] OR nil
  end

  def won?
    if self.win_line == ["X", "X", "X"]
      true
    elsif self.win_line == ["O", "O", "O"]
      true
    end
  end

  def draw?
    if self.win_line == nil
      true
    end
  end

  def winner
    if self.win_line == ["X", "X", "X"]
      "X"
    elsif self.win_line == ["O", "O", "O"]
      "O"
    end
  end

  def turn
    player_move = self.current_player.move(self.board)
    if self.board.valid_move?(player_move)
      self.board.update(player_move, self.current_player)
      self.board.display
    else
      loop do
        puts "That is not a valid move, please enter 1-9."
        player_move = self.current_player.move(self.board)
        if self.board.valid_move?(player_move)
          self.board.update(player_move, self.current_player)
          self.board.display
          break
        end # if end 2
      end # loop end
    end # if end 1
  end # def turn end

  def play
    if # check whether the game is over
    # make turns until the game is over
    # when the game is over, congratulate the winner or print cats game
  end # def play end

end

# hat = Game.new
#
# hat.turn
# hat.turn
# hat.turn
