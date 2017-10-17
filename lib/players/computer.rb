require 'pry'
class Players
  class Computer <  Player 
    # def input(input)
    #   input = rand(8).to_s 
    # end

    def move(board)
      # binding.pry
      # offense
      # defense
      # take middle? "5"
      # take corner? ["1", "3", ""]
      # .sample works well with the select iterator
      # take side?
      
      self.defense(board)
      # self.board.valid_move?(input)
      
      
    end
      
  

    def opponent_token
      self.token == "X" ? "O" : "X"
    end

    def defense(board)
      counter = 0
      index = nil

      board.cells.each_with_index do |e, i|
        if e == ' ' || e.nil?
         counter += 1
         index = i
        end
      end

      if counter == 1
        puts 'returning index'
        return (index + 1).to_s
      end
    
      Game.win_combo.each do |combo|

        if   (board.cells[combo[0]] == board.cells[combo[1]]) && board.cells[combo[1]] != " "
          # binding.pry  
          if !board.taken?((combo[2] + 1).to_s) 
             return (combo[2] + 1).to_s 
          end
        end  
           
        if board.cells[combo[2]] == board.cells[combo[1]] && board.cells[combo[1]] != " " 
          if !board.taken?((combo[0] + 1).to_s)
            return (combo[0] + 1).to_s
          end
        end  

        if board.cells[combo[2]] == board.cells[combo[0]] && board.cells[combo[2]] != " " 
          puts combo
          board.display
          puts !board.taken?((combo[1] + 1).to_s)
          if !board.taken?((combo[1] + 1).to_s)
            return (combo[1] + 1).to_s
          end
        end

      
      end
      (rand(8) + 1).to_s
    end

    def take_middle?
      input = "5"
    end
    def take_corner?
      
      input = ["1", "3", "7" ,"9"]
      input.select { |i| !board.taken?(i) }.sample
    end

    def take_side?
      input = ["2", "4", "6", "8"]
      input.select { |i| !board.taken?(i) }.sample
    end
  end  
end


