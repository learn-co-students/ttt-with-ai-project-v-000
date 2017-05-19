module Players
  class Computer < Player
    attr_accessor :move

    def move(board)
      empty_cells = empty_moves(board)
      number_of_moves_left = empty_cells.count
      move_made = empty_cells[rand(0..number_of_moves_left-1)]+1
      move_made.to_s

    #   if empty_cells.count == 9
    #     move_made = "5"
    #   elsif empty_cells.include?("5")
    #     move_made = "5"
    #     binding.pry
    #   else
    #     binding.pry
    #     if current_player = player_1
    #       other_player_token = player_2.token
    #     else
    #       other_player_token = player_1.token
    #     end
    #     status = false
    #     binding.pry
    #     WIN_COMBINATIONS.each do |combination|
    #       if status == false
    #         count = 0
    #         index = 0
    #
    #         other_player_moves = combination.collect {|a| @board.cells[a] == other_player_token}
    #         binding.pry
    #         if other_player_moves.count ==2
    #           binding.pry
    #           other_cell = combination - other_player_moves
    #           if @board.cells[other_cell]=" " || ""
    #             move_made = other_cell
    #             status = true
    #           end #if end
    #         end
    #       end # if end
    #     end #do end
    #     if status == false
    #       move_made = rand(0..number_of_moves_left-1).to_s
    #       binding.pry
    #     end
    #   end
    #
    end #move end

    def empty_moves(board)
      array = []
      index = 0
      board.cells.each do |i|
        if i == " "
          array.push(index)
        end
        index+=1
      end
      array
    end

  end

end
