module InputOutput
  class CLI < InputOutput::Base
    def display(output)
      puts output
    end

    def read
      gets.chomp
    end
  end
end
