module Players
  class Computer < Player

    attr_reader :difficulty

    def initialize(token, difficulty = 1)
      super(token)
      @difficulty = difficulty
    end

    def move(board)
      puts "Computer level: #{difficulty}"
      # temporarily brute-forces a choice
      choose_move(board)
    end

    def choose_move(board)
      chance = 80 if difficulty == "1"
      chance = 90 if difficulty == "2"
      chance = 100 if difficulty == "3"
      chance < Random.rand(100) + 1 ? poor_move(board) : better_move(board)
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

      #look for common patterns
      cell = look_for_common_patterns(board) if !cell && board.turn_count == 3


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

    def look_for_common_patterns(board)
      cells = []
      board.cells.each_with_index { |e, i| cells << i if e != " " }
      cell = nil
      cell = 1 if cells == [0,4,8] && board.cells[4] == 'O'
      cell = 2 if cells == [0,4,8] && board.cells[4] == 'X'
      cell = 5 if cells == [2,4,6] && board.cells[4] == 'O'
      cell = 6 if cells == [0,4,7]
      cell = 8 if cells == [4,5,6] || cells == [4,5,7] || cells == [2,4,7]
      cell
    end

    def retrieve_next_available_non_corner_cell(board)
      cell = nil
      board.cells.each_with_index do |e, index|
        if index != 0 || index != 2 || index != 6 || index != 8
          if e == " "
            cell = index
            break
          end
        end
      end
      cell
    end

    def find_at_risk_cell(combination, board, token)
      array = combination.map { |e| board.cells[e] }
      combination[array.index(" ")] if array.count(token) == 2 && array.index(" ")
    end

  end
end