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
      #if you can win, return that spot and move there
      if almost_win?(board) == true
        (win_or_block(board, self.token)+1).to_s
      #else if you are going to lose, return that spot and block opponent
      elsif almost_lose?(board) == true
        (win_or_block(board, self.opponent.token)+1).to_s
      else
        select_combinations = find_available_combinations(board,self.token).select {|combo| (combo & find_moves_made(board,self.token)).count >= 1}
        #else if you have more than 1 spots from a winning combination, pick a spot from that combination
        if select_combinations.count > 1
          a_combination = select_combinations.sample
          ((a_combination - find_moves_made(board,self.token)).sample+1).to_s
        #else if you have 1 spot from a winning combination, pick a spot from that combination
        elsif select_combinations.count == 1
          (a_combination = select_combinations.flatten.sample + 1).to_s
        #else if there's no matching spots from a winning combination, just pick one
        elsif find_available_combinations(board, self.token) != []
          random_combinations = find_available_combinations(board, self.token).sample
          ((random_combinations.sample)+1).to_s
        else
        #otherwise, just settle for whatever spots that are left
          (find_available_moves(board).sample+1).to_s
        end
      end
    end

    #find all the empty spaces on the board
    def find_available_moves(board)
        board.cells.each_with_index.collect {|v,i| i if v == " "}.compact
    end

    #find the positions that are taken up by specified player token
    def find_moves_made(board, token)
      if token == self.token
        board.cells.each_with_index.collect {|v,i| i if v == self.token}.compact
      else
        board.cells.each_with_index.collect {|v,i| i if v == self.opponent.token}.compact
      end
    end

    #find the combinations from Game::WIN_COMBINATIONS that are still options
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

    #find out if the opponent is going to win in the next move
    def almost_lose?(board)
      !almost_win?(board) && find_available_combinations(board, self.opponent.token).any? {|combo| (combo & find_moves_made(board, self.opponent.token)).count == 2 }

    end

    #find out if you can win on this move
    def almost_win?(board)
      find_available_combinations(board, self.token).any? {|combo| (combo & find_moves_made(board, self.token)).count == 2 }
    end

    #if you can win, return the winning spot, if you are not and Your opponent is going to win, return that spot so you can block them.
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
