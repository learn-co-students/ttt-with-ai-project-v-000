#require_relative '../player.rb'
#take center if avail and 1st move
#try to win
#try to block
#take center if available
#take corner if available
#random

module Players
  class Computer < Player
    attr_reader :board
    def move(board)
      #auto move - center
      if board.turn_count == 0
        puts "#{self.token} picks square 5."
        return 5
      end

      #random level
      open_cells = []
        board.cells.each_with_index{|e,i|
        if e == " "
          open_cells << i + 1
        end
      }

      # intermediate level
      win_combos = Game.win_combos
        #can we make a win combo?
        open_cells.each{|e|
          theoretical_board = Board.new
          theoretical_board.cells = board.cells.clone
          theoretical_board.update(e,self)
          thewinner = win_combos.detect{|c|
            c.collect{|a| theoretical_board.cells[a]}.count(self.token) == 3
          }
          if !!thewinner
            puts "found winner"
            return thewinner.detect{|e|
              board.cells[e] == " "
            } + 1
          end
        }
        #can we block
        if self.token == "X"
          opp_token = "O"
        else
          opp_token = "X"
        end

        open_cells.each{|e|
          theoretical_board = Board.new
          theoretical_board.cells = board.cells.clone
          theoretical_board.cells[e-1] = opp_token
          #puts theoretical_board.cells.inspect
          theblock = win_combos.detect{|c|
            c.collect{|a| theoretical_board.cells[a]}.count(opp_token) == 3
          }

          #puts theblock.inspect
          if !!theblock
            puts "found block"
            return theblock.detect{|e|
              board.cells[e] == " "
            } + 1
          end
        }

      #take middle if available
      if !board.taken?(5)
        puts "#{self.token} picks square 5."
        return 5
      end

      #take available corner
      avail_corner = [1,3,7,9].detect{|e|
        !board.taken?(e)
      }
      if !!avail_corner
        puts "Corner: #{avail_corner}"
        return avail_corner
      end


      s = open_cells.sample.to_s
      puts "#{self.token} picks square #{s}."
      s
    end
  end

end

#hal = Players::Computer.new("O")
#puts hal.move(["X"," "," "," ","O","X"," "," "," "])
