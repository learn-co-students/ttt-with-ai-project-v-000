require "pry"
class Game
  attr_accessor :board, :player_1, :player_2
  extend Players

  WIN_COMBINATIONS=[
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    self.player_1=player_1
    self.player_2=player_2
    self.board=board
  end


  def current_player
    if player_1.token == "X" && board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    combo=[]
    WIN_COMBINATIONS.select do |win_option|
      match_check=board.cells.values_at(win_option[0],win_option[1],win_option[2])
      combo=win_option if match_check.all?{|token| token=="X"}
      combo=win_option if match_check.all?{|token| token=="O"}
    end

    if combo != []
      combo
    else
      false
    end

  end

  def draw?
    draw = true if !board.cells.include?(" ")
    draw = false if won?
    draw
  end

  def over?
    true if draw? || won?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
      value = current_player.move(board)
      if !board.valid_move?(value)
        puts "invalid"
        value = current_player.move(board)
      end
      board.update(value, current_player)
  end


  def play
    until won? || draw? || over?
      turn
      board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

  def self.create(player_1, player_2, board)
    game=Game.new(player_1, player_2, board)
    board.display
    game.play
  end
end
