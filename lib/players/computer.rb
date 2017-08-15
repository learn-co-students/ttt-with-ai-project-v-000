require 'pry'

module Players
  class Computer < Player
      attr_accessor :valid_move, :new_inst


      WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8],  # bottom row
        [0,3,6],
       [1,4,7],
        [2,5,8],
        [0,4,8],
      [2,4,6],
         #ETC, an array for each win combination
      ]



      def move(inst)

        @valid_move = []
        valid_position = []


        inst.cells.each_with_index do |num, ind|

            position = ind + 1

            @valid_move << "#{position}" if inst.valid_move?("#{position}") == true
          #binding.pry
        end

    #  valid_moves = @valid_move.sample
      valid_position = best_move(@valid_move, inst)
      #valid_move = valid_moves.sample
      valid_position.sample
      end #move

      def best_move(arry, inst)
        no_change = 0
        new_arry = []

        best_move = {}
        best_position = ""
        block_position = ""

        new_inst = inst.dup


          com_tok = "X" if self.token == "O"
          com_tok = "O" if self.token == "X"


        arry.each do |number|
          temp = new_inst.cells[number.to_i - 1]
          new_inst.cells[number.to_i - 1] = self.token
          if won?(new_inst) == true
            best_move[number] = 10
          elsif draw?(new_inst) == true
            best_move[number] = 5
          else
            best_move[number] = 0
          end
          new_inst.cells[number.to_i - 1] = temp
        end

        max_key= -1
        best_move.each do |val, key|

          if max_key < key
            max_key = key
            best_position = val

          end

        end
        best_move = {}
        arry.each do |number|
          temp = new_inst.cells[number.to_i - 1]
          new_inst.cells[number.to_i - 1] = com_tok
          if won?(new_inst) == true
            best_move[number] = 8
          elsif draw?(new_inst) == true
            best_move[number] = 4
          else
            best_move[number] = 0
          end
          new_inst.cells[number.to_i - 1] = temp
        end

        max_key= -1
        best_move.each do |val, key|

          if max_key < key

            max_key = key
            block_position = val

          end

        end

        if max_key == 0
          arry
        elsif best_position >= block_position
           new_arry << best_position
        elsif block_position > best_position
             new_arry << block_position
        end




      end #ai
      def won?(inst)
        flag = false
            WIN_COMBINATIONS.each do |combi|
              x_count = 0
              o_count = 0
              combi.each do |num|

                if inst.cells[num] == "X"
                  x_count = x_count + 1
                  if x_count == 3

                     flag = true

                  end
                elsif inst.cells[num] == "O"
                  o_count = o_count + 1
                  if o_count == 3
                    flag = true

                  end
                end #if board.cells
              end#combi
            end #WIN_COM


          flag

      end #won?
      def draw?(inst)
        if inst.turn_count == 9
          if won?(inst) == false
            true
          else
            false
          end
        else
          false
        end
      end


    end #class

end # module
