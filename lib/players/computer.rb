module Players

  class Computer < Player

    def move(board)
      current_board = board.cells
      new_sim = Sim.new(Computer.new("X"),Computer.new("O"),current_board)
      potential_moves = self.get_empties(board)

      scoreboard = []

      #run trials
      10.times do
        trial_scores = new_sim.run_trial
        trial_scores.each_with_index do |score,index|
          if potential_moves.include?(i)
            scoreboard << [index,score]
          end
        end
      end

      best = scoreboard.max_by do |array|
        array[1]
      end

      (best[0]+1).to_s
    end

    def ran_move(board)
      #randomly chooses an open position
      empties = self.get_empties(board)
      (empties.sample + 1).to_s
    end

    def get_empties(board)
      #collects indices of empty spaces on board in array and returns array
      empties = []
      board.cells.each_with_index do |cell,index|
        if cell == " "
          empties << index
        end
      end
      empties
    end

  end #end Computer class

  class Sim
    attr_accessor :player_1, :player_2, :board, :scoreboard

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
    ]

    def initialize(p1=Computer.new("X"),p2=Computer.new("O"),
        board=Board.new)
      @player_1 = p1
      @player_2 = p2
      @board = board
      @scoreboard = [0,0,0,0,0,0,0,0,0]
    end

    def current_player
      self.board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def over?
      self.won? || self.draw?
    end

    def winner
      #check if X has won
      out = WIN_COMBINATIONS.detect do |win_combo|
        win_combo.all? do |index|
          self.board.cells[index] == "X"
        end
      end

      if out
        return "X"
      end

      #if X hasnt won check for O winning
      out = WIN_COMBINATIONS.detect do |win_combo|
        win_combo.all? do |index|
          self.board.cells[index] == "O"
        end
      end

      if out
        return "O"
      else
        return nil
      end
    end

    def won?
      self.winner ? true : false
    end

    def draw?
      self.board.full? && !self.won?
    end

    # def turn
    #   prompting = true
    #   while prompting
    #     input = self.current_player.move(self.board)
    #     if self.board.valid_move?(input)
    #       return self.board.update(input,self.current_player)
    #     end
    #   end
    # end

    def trial_turn
      running = true
      while running
        input = self.current_player.ran_move(self.board)
        if self.board.valid_move?(input)
          return self.board.update(input,self.current_player)
        end
      end
    end

    # def play
    #   while !self.over?
    #     self.turn
    #   end
    #
    #   if self.draw?
    #     puts "Cat's Game!"
    #   else
    #     puts "Congratulations #{self.winner}!"
    #   end
    # end

    def run_trial
      while !self.over?
        self.trial_turn
      end

      #do scoring if not a draw
      if winner
        self.board.cells.each_with_index do |cell,index|
          if cell == winner.token
            self.scoreboard[index] += 1
          elsif cell == " "
          else
            self.scoreboard[index] -= 1
          end
        end
      end
      self.scoreboard
    end

  end #end Sim class

end #end module
