module Players

  class Computer < Player
    # Computer chooses best move based on monte carlo sims
    # Sims are done using subclass Sim which inherits from Game
    def move(board)
      potential_moves = self.get_empties(board)

      #scoreboard to rate best move
      scoreboard = [0,0,0,0,0,0,0,0,0]

      temp_board = Board.new
      new_sim = Sim.new(Computer.new("X"),Computer.new("O"),temp_board)

      #run trials
      200.times do

        #reset board, duplicate current board positions (array) onto new Board
        new_sim.board.reset!
        new_sim.board.cells = board.cells.dup

        # run trial
        trial_scores = new_sim.run_trial

        #add trial scores to scoreboard
        trial_scores.each_with_index do |score,index|
          if potential_moves.include?(index)
            #add trial score to scoreboard balance (index is the move location)
            scoreboard[index] += score
          else
            #spaces we cant move to are set at -infin so we can use max function
            scoreboard[index] = -1.0/0
          end
        end
      end

      #get best score and make best score array
      #array is for if multiple potential moves have the same score
      best = scoreboard.max
      best_array = []

      #iterate through scoreboard getting best scores and adding the position
      #of those scores to the best array
      scoreboard.each_with_index do |score,index|
        if score == best
          best_array << index
        end
      end

      #randomly choose one of best array, add 1 to convert to 1-9 scale,
      #return as string
      (best_array.sample+1).to_s
    end

    def ran_move(board)
      #randomly chooses an open position
      empties = self.get_empties(board)

      #make winning move if available
      #to help skew best move results, not sure how effective
      empties.each do |position|
        temp_board = Board.new
        new_sim = Sim.new(Computer.new("X"),Computer.new("O"),temp_board)
        new_sim.board.cells = board.cells.dup
        new_sim.board.update((position+1).to_s,self)
        if new_sim.won?
          return (position+1).to_s
        end
      end

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

  #monte carlo simulator
  class Sim < Game
    attr_accessor :scoreboard

    #self.scoreboard keeps track of move rankings
    def initialize(p1=Computer.new("X"),p2=Computer.new("O"),
        board=Board.new)
      @player_1 = p1
      @player_2 = p2
      @board = board
      @scoreboard = [0,0,0,0,0,0,0,0,0]
    end

    #same as turn but uses Computer #ran_move instead of #move
    def trial_turn
      running = true
      while running
        input = self.current_player.ran_move(self.board)
        if self.board.valid_move?(input)
          return self.board.update(input,self.current_player)
        end
      end
    end

    #run one trial, ranks board spots at endgame state, returns rankings
    def run_trial
      while !self.over?
        self.trial_turn
      end

      #do scoring if not a draw
      if winner

        #+1 if winning spot, -1 if losing spot
        self.board.cells.each_with_index do |cell,index|
          if cell == winner
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
