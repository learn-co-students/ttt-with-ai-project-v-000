module Players
  class Computer < Player

    attr_accessor :g

    def move(board)
      if board.turn_count % 2 == 0
        a = "X"
        b = "O"
      elsif board.turn_count % 2 == 1
        a = "O"
        b = "X"
      end

      c = 0
      cc = 0
      @g = board.turn_count

      if board.turn_count == 0
        return "1"
      else
        WIN_COMBINATIONS.each do |combo|
          xx = combo[0]
          yy = combo[1]
          zz = combo[2]
          if board.cells[xx] == a
            cc += 1
            dd = "taken"
          end
          if board.cells[yy] == a
            cc += 1
            ee = "taken"
          end
          if board.cells[zz] == a
            cc += 1
            ff = "taken"
          end
          if cc == 2
            @g += 1
          end
          if cc == 2 and dd != "taken"
            return "#{xx}"
          elsif cc == 2 and ee != "taken"
            return "#{yy}"
          elsif cc == 2 and ff != "taken"
            return "#{zz}"
          end
        end
      end


          if @g = board.turn_count
            WIN_COMBINATIONS.each do |combo|
              x = combo[0]
              y = combo[1]
              z = combo[2]
              if board.cells[x] == b
                c += 1
                d = "taken"
              end
              if board.cells[y] == b
                c += 1
                e = "taken"
              end
              if board.cells[z] == b
                c += 1
                f = "taken"
              end
              if c == 2
                @g += 1
              end
              if c == 2 and d != "taken"
                return "#{x}"
              elsif c == 2 and e != "taken"
                return "#{y}"
              elsif c == 2 and f != "taken"
                return "#{z}"
              end
            end
          end

          if @g == board.turn_count
            if board.cells[4] == " "
              return "5"
            elsif board.cells[0] == " "
              return "1"
            elsif board.cells[2] == " "
              return "3"
            elsif board.cells[6] == " "
              return "7"
            elsif board.cells[8] == " "
              return "9"
            elsif board.cells[1] == " "
              return "2"
            elsif board.cells[3] == " "
              return "4"
            elsif board.cells[5] == " "
              return "6"
            elsif board.cells[7] == " "
              return "8"
            end
          end
      end
    end
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
    ]
  end
