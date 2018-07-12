require 'set'
class Game

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

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end


  def current_player
    @board.turn_count.even? ? self.player_1 : self.player_2
  end

  def won?(with_winner = false)
        x_won = false
        o_won = false
        combo = []
        x_spaces = Set.new(spaces("X"))
        o_spaces = Set.new(spaces("O"))
        combos = WIN_COMBINATIONS.map{|c| Set.new(c)}
        combos.each do |win_combo|
            if win_combo.subset?(x_spaces)
              x_won = true
              combo = win_combo.to_a
            elsif win_combo.subset?(o_spaces)
              o_won = true
              combo = win_combo.to_a
            end
            break if x_won || o_won
        end

        if x_won || o_won
          with_winner ? [combo, x_won ? "X" : "O"] : combo
        else
          false
        end
    end

  def spaces(type)
    spaces = []
    @board.cells.each.with_index do |a, i|
      spaces << i if a == type
    end
    spaces
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? won?(true)[1] : nil
  end

  def turn
    puts "\n\n\n"
    @board.display
    puts "\n\n"
    puts "#{current_player.token}'s Turn (1-9)"
    move = current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, current_player)
    else
      puts "Invalid move."
      turn
    end
  end

  def play
    while !over?
      turn
    end
    puts "\n\n\n\n"
    @board.display
    puts "\n\n"
    puts winner.nil? ? "Cat's Game!" : "Congratulations #{winner}!"
  end

end
