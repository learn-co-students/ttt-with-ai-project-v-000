module Players
  class Computer < Player

    

    def move(board)
      if board.turn_count % 2 == 0
        a = "X"
        b = "O"
      elsif board.turn_count % 2 == 1
        a = "O"
        b = "X"
      end

      
      
      g = board.turn_count
      h = board.turn_count
# binding.pry 
      if h == 0
        return "1"
      else
        WIN_COMBINATIONS.each do |combo|
          xx = combo[0]
          yy = combo[1]
          zz = combo[2]
          cc = 0
          if board.cells[xx] == a
            cc += 1
          end
          if board.cells[yy] == a
            cc += 1
          end
          if board.cells[zz] == a
            cc += 1
          end
          if cc == 2 && board.cells[xx] == " "
            g += 1
            return "#{(xx + 1)}"
          elsif cc == 2 && board.cells[yy] == " "
               g += 1
            return "#{(yy + 1)}"
          elsif cc == 2 && board.cells[zz] == " "
             g += 1
            return "#{(zz + 1)}"
          end
        end
      end



          if g == h
            WIN_COMBINATIONS.each do |combo|
              x = combo[0]
              y = combo[1]
              z = combo[2]
              c = 0
              if board.cells[x] == b
                c += 1
              end
              if board.cells[y] == b
                c += 1
              end
              if board.cells[z] == b
                c += 1
              end
              if c == 2 && board.cells[x] == " "
                g += 1
                return "#{(x + 1)}"
              elsif c == 2 && board.cells[y] == " "
                g += 1
                return "#{(y + 1)}"
              elsif c == 2 && board.cells[z] == " "
                g += 1
                return "#{(z + 1)}"
              end
            end
          end
 
          if g == h
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
