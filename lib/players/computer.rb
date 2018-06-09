
module Players
  class Computer < Player
    attr_reader :urgent_move, :corner_move, :fork_move

    def win_or_block?(board)
      if board.turn_count.between?(2, 7)
        Game.win_combinations.any? { |set|
          if board.cells[set[0]] != ' ' && board.cells[set[0]] == board.cells[set[1]] && board.cells[set[2]] == ' '
            @urgent_move = "#{set[2] + 1}"
            true
          elsif board.cells[set[1]] != ' ' && board.cells[set[1]] == board.cells[set[2]] && board.cells[set[0]] == ' '
            @urgent_move = "#{set[0] + 1}"
            true
          elsif board.cells[set[2]] != ' ' && board.cells[set[2]] == board.cells[set[0]] && board.cells[set[1]] == ' '
            @urgent_move = "#{set[1] + 1}"
            true
          end
        }
      end
    end

    def fork_win?(sham)
      fraud = sham.dup
      total_wins = 0
      Game.win_combinations.each { |combo|
        if fraud[combo[0]] != ' ' && fraud[combo[0]] == fraud[combo[1]] && fraud[combo[2]] == ' '
          total_wins += 1
        elsif fraud[combo[1]] != ' ' && fraud[combo[1]] == fraud[combo[2]] && fraud[combo[0]] == ' '
          total_wins += 1
        elsif fraud[combo[2]] != ' ' && fraud[combo[2]] == fraud[combo[0]] && fraud[combo[1]] == ' '
          total_wins += 1
        end
      }
      total_wins >= 2 ? true : false
    end

    def fork_threat?(phony)
      clone = phony.dup
      clone.each_with_index { |area, index|
        if area == ' '
          clone[index] = 'X'
          if fork_win?(clone)
            true
          end

          clone[index] = 'O'
          if fork_win?(clone)
            true
          end
          clone[index] = ' '
        end
      }
      false
    end

    def fork_found?(board)
      if board.turn_count.between?(1, 6)
        fake = board.cells.dup
        fake.each_with_index { |spot, index|
          if spot == ' '
            fake[index] = 'X'
            if fork_threat?(fake)
              @fork_move = "#{index + 1}"
              true
            end

            fake[index] = 'O'
            if fork_threat?(fake)
              @fork_move = "#{index + 1}"
              true
            end
            fake[index] = ' '
          end
        }
        false
      end
    end

    def counter_corner?(board)
      if board.turn_count.between?(0, 6)
        enemy = token == 'O' ? 'X' : 'O'
        if board.position('1') == enemy && board.position('9') == ' '
          @corner_move = '9'
          true
        elsif board.position('9') == enemy && board.position('1') == ' '
          @corner_move = '1'
          true
        elsif board.position('3') == enemy && board.position('7') == ' '
          @corner_move = '7'
          true
        elsif board.position('7') == enemy && board.position('3') == ' '
          @corner_move = '3'
          true
        end
        false
      end
    end

    def move(board)
      corners = ['1','3','7','9']
      edges = ['2','4','6','8']

      if win_or_block?(board)
        puts 'w/b'
        urgent_move
      elsif fork_found?(board)
        puts 'f'
        fork_move
      elsif board.position('5') == ' '
        '5'
      elsif counter_corner?(board)
        puts 'c'
        corner_move
      else
        puts 'e/c'
        corners.detect { |area| board.position(area) == ' ' } || edges.detect { |area| board.position(area) == ' ' }
      end
    end

  end
end
