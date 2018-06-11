module Players

  class Computer < Player

    def win_or_block(board)
      if board.turn_count.between?(2, 7)
        move = nil

        Game.win_combinations.each { |set|
          if board.cells[set[0]] != ' ' &&
            board.cells[set[0]] == board.cells[set[1]] &&
            board.cells[set[2]] == ' '
            move = "#{set[2] + 1}"
            break
          elsif board.cells[set[1]] != ' ' &&
              board.cells[set[1]] == board.cells[set[2]] &&
              board.cells[set[0]] == ' '
              move = "#{set[0] + 1}"
              break
            elsif board.cells[set[2]] != ' ' &&
              board.cells[set[2]] == board.cells[set[0]] &&
              board.cells[set[1]] == ' '
              move = "#{set[1] + 1}"
              break
            end
          }

          move
        end
      end

      def center(board)
        '5' if board.position('5') == ' '
      end

      def counter_corner(board)
        enemy = token == 'O' ? 'X' : 'O'

        if board.position('1') == enemy && board.position('9') == ' '
          '9'
        elsif board.position('9') == enemy && board.position('1') == ' '
          '1'
        elsif board.position('3') == enemy && board.position('7') == ' '
          '7'
        elsif board.position('7') == enemy && board.position('3') == ' '
          '3'
        end
      end

      def corners_or_edges(board)
        corners = ['1','3','7','9']
        edges = ['2','4','6','8']

        corners.shuffle.detect { |area| board.position(area) == ' ' } || +
        edges.shuffle.detect { |area| board.position(area) == ' ' }
      end

      def move(board)
        win_or_block(board) || center(board) || counter_corner(board) ||
        corners_or_edges(board)
      end

      #  VALID_MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      #  def move(board)
      #    VALID_MOVES.sample
      #  end

  end

end

=begin

def move(board)
if it's the first turn,
try putting the token in position 5
if 5 is taken, try 1,3,7,9

save the first move

look at WIN_COMBINATIONS to determine which options contain the first move
pull the other numbers that could fulfill a win combination
win_cominations.each do |combo|
if combo.include?(first_move)

winning moves = [all numbers that include the first_move]
try the first one from the first combo, if taken go to the second possible combo, try the first index, etc.

then, look at WIN_COMBINATIONS, include, similar step based on second_move and first_move

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
[0,4,8], [6,4,2]]

  if !board.taken?("5")
    "5"
  elsif !board.taken?("1")
    "1"
  elsif !board.taken?()
=end
