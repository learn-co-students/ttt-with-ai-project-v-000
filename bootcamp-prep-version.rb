class TicTacToe
  
    def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
  
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  
    def input_to_index(user_input)
      user_input.to_i - 1
    end
  
    def move(index, current_player = "X")
      @board[index] = current_player
    end
  
    def position_taken?(location)
      @board[location] != " " && @board[location] != ""
    end
  
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end
  
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      player = current_player
      index = input_to_index(input)
  
      if valid_move?(index)
        move(index, player)
        display_board
      else
        turn
      end
    end
  
    def turn_count
      count = 0
      @board.each do |item|
        if item == "X" || item == "O"
          count += 1
        end
      end
      return count
    end
  
    def current_player
      if turn_count.even?
        "X"
      else
        "O"
      end
    end
  
  
    # def won?
    #   WIN_COMBINATIONS.detect do |win_combo|
    #     @board[win_combo[0]] == @board[win_combo[1]] && \
    #     @board[win_combo[1]] == @board[win_combo[2]] && \
    #     position_taken?(win_combo[0])
    #   end
    # end
  
    def won?
      WIN_COMBINATIONS.any? do |combo|
        if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
          return combo
        end
      end
    end


    def full?
      @board.all? do |item|
        item == "X" || item == "O"
      end
    end
  
    def draw?
      full? && !won?
    end
  
    def over?
      draw? || won?
    end
  
    def winner
      if won?
        winning_space = won?
        @board[winning_space[0]]
      end
    end
  
    def play
      if !over?
        turn
        play
      elsif won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
  
  end