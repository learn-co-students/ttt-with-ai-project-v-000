module Players
  class Computer < Player

    attr_reader :difficulty

    def initialize(token, difficulty = 1)
      super(token)
      @difficulty = difficulty
    end

    def move(board)
      puts "difficulty: #{difficulty}"
      # temporarily brute-forces a choice
      better_move(board)
    end

    def poor_move(board)
      flag = false
      until flag
        selected = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
        flag = true if board.valid_move?(selected)
      end 
      selected
    end

    def better_move(board)
      cell = nil

      # Attempt to win first
      Game::WIN_COMBINATIONS.each do |combination|
        cell = find_at_risk_cell(combination, board, token)
        break if cell
      end

      # Attempt to defend next
      if !cell
        Game::WIN_COMBINATIONS.each do |combination|
          cell = find_at_risk_cell(combination, board, token == 'X' ? 'O' : 'X')
          break if cell
        end
      end

      #pick middle if possible
      cell = 4 if !cell && board.cells[4] == " "

      #pick corners next if possible
      cell = 0 if !cell && board.cells[0] == " "
      cell = 2 if !cell && board.cells[2] == " "
      cell = 6 if !cell && board.cells[6] == " "
      cell = 8 if !cell && board.cells[8] == " "

      cell = "#{cell + 1}" if cell

      #pick at random
      cell = poor_move(board) if !cell
      cell
    end

    private

    def find_at_risk_cell(combination, board, token)
      array = combination.map { |e| board.cells[e] }
      combination[array.index(" ")] if array.count(token) == 2 && array.index(" ")
    end

  end
end