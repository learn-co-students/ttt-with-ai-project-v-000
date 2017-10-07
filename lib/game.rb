require 'pry'
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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

    def current_player
      board.turn_count.even? ? @player_1 : @player_2
    end

    def turn
      player = current_player
      current_move = player.move(board)
    if board.valid_move?(current_move)
      board.update(current_move,player)
      board.display
      else
        turn
      end
    end

    def play
      until over? || won? || draw?
        turn
      end

      if winner
        puts "Congratulations #{winner}!"
      end

      if draw?
        puts "Cat's Game!"
      end
    end

    def over?
      if draw? || won?
        true
      else
        false
      end
    end

    def draw?
      board.full? && !won?
    end

    def won?
    WIN_COMBINATIONS.detect do |win_combination|

        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        pos_1 = board.cells[win_index_1]
        pos_2 = board.cells[win_index_2]
        pos_3 = board.cells[win_index_3]


        if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
          binding.pry
          return win_combination
        end

        if pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
          binding.pry
          return win_combination
        end

      end#do
    end

    def winner
      if won?
        won?.select do |pos|
          binding.pry
      if board.cells[pos[0]] == "X"
        return "X"
      else board.cells[pos[0]] == "O"
        return "O"
      end
      end
    end
    end




end #Game
