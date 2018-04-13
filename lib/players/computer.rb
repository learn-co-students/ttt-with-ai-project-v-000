module Players
  class Computer < Player

    attr_accessor :opponent, :board

    def initialize(token)
      super
      if self.token == "X"
        self.opponent = Player.new("O")
      else
        self.opponent = Player.new("X")
      end
    end


    def move(board)
      if almost_win?(board) == true
        (win_or_block(board, self.token)+1).to_s
      elsif almost_lose?(board) == true
        (win_or_block(board, self.opponent.token)+1).to_s
      else
        select_combinations = find_available_combinations(board,self.token).select {|combo| (combo & find_moves_made(board,self.token)).count >= 1}
        if select_combinations.count > 1
          a_combination = select_combinations.sample
          ((a_combination - find_moves_made(board,self.token)).sample+1).to_s
        elsif select_combinations.count == 1
          (a_combination = select_combinations.flatten.sample + 1).to_s
        elsif find_available_combinations(board, self.token) != []
          random_combinations = find_available_combinations(board, self.token).sample
          ((random_combinations.sample)+1).to_s
        else
          (find_available_moves(board).sample+1).to_s
        end
      end
    end

    def find_available_moves(board)
        board.cells.each_with_index.collect {|v,i| i if v == " "}.compact
    end

    def find_moves_made(board, token)
      if token == self.token
        board.cells.each_with_index.collect {|v,i| i if v == self.token}.compact
      else
        board.cells.each_with_index.collect {|v,i| i if v == self.opponent.token}.compact
      end
    end

    def find_available_combinations(board, token)
      if token == self.token
        valid_and_made_moves = self.find_available_moves(board) + self.find_moves_made(board, self.token)
        Game::WIN_COMBINATIONS.select do |combo|
          (valid_and_made_moves & combo).count > 2
        end
      else
        valid_and_made_moves = self.find_available_moves(board) + self.find_moves_made(board, self.opponent.token)
        Game::WIN_COMBINATIONS.select do |combo|
          (valid_and_made_moves & combo).count > 2
        end
      end
    end

    def almost_lose?(board)
      !almost_win?(board) && find_available_combinations(board, self.opponent.token).any? {|combo| (combo & find_moves_made(board, self.opponent.token)).count == 2 }

    end

    def almost_win?(board)
      find_available_combinations(board, self.token).any? {|combo| (combo & find_moves_made(board, self.token)).count == 2 }
    end

    def win_or_block(board, token)
      if token == self.token
        winning_combinations = find_available_combinations(board, self.token).select {|combo| (combo & find_moves_made(board, self.token)).count == 2 }
        winning_combination = winning_combinations.sample
        (winning_combination - find_moves_made(board, self.token)).first
      else
        winning_combinations = find_available_combinations(board, self.opponent.token).select {|combo| (combo & find_moves_made(board, self.opponent.token)).count == 2 }
        winning_combination = winning_combinations.sample
        (winning_combination - find_moves_made(board, self.opponent.token)).first
      end
    end

  end
end
