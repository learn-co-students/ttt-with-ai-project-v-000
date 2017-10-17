module Players
    class Computer < Player

      def move(board)
          num = rand(9).to_s
          return num
      end

    end
end
