module Players
  class Computer < Player

    attr_reader :board, :game
    attr_accessor :x_player_index, :o_player_index, :free_cells

    def initialize(token)
      super(token)
      @x_player_index = []
      @o_player_index = []
      @free_cells = []
    end

    def free_cell_indices
      #Returns an array of board indices (0-8) that are free (no X or O)
      (0..board.cells.length).flat_map do |i|
        board.taken?(i + 1) ? [] : [i]
      end
    end

    def board_index_for_token(token)
      if token == "X"
        @x_player_index
      elsif token == "O"
         @o_player_index
      end
    end

    def combination_with_free_cells
      #iterates over WIN_COMBINATIONS to access each winning combination
      game.WIN_COMBINATIONS.each do |combinations|
        #iterates over each winning combinations, selects and returns those combinations
        #that include free cell indices from free_cell_indices method
        combinations.select do |combination|
          free_cell_indices.each { |i| combination.include?(i)}
        end
      end
    end

    def one_from_winning(token)
      one_from_win = []
      game.WIN_COMBINATIONS.each do |combination|
        one_from_win << (combination - board_index_for_token(token)).count == 1
      end 
    end

        

    def free_cells
      game.WIN_COMBINATIONS.detect do |combination|
        combo_chars = combination.map { |i| board.cells[i] }
        combo_chars.all? { |c| c == " " } 
      end
    end

    def winning_route(token)
      combination_with_free_cells

    def cell_indices
      #Returns an array of board indices (0-8) that are free (no X or O)
      board.cells.each_with_index do |c,i|
        if board.taken?(i + 1) && c == "X"
           @x_player_index << i
        elsif board.taken?(i + 1) && c == "O"
          @o_player_index << i
        elsif !board.taken?
          @free_cells << i
        else
          nil
        end
      end
    end

   


    

    def one_step_from_winning(token)
      combination_with_free_cells

    


  end
end



  
  
  
 




