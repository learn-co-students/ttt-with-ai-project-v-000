require "./lib/ai/ai.rb"
require "./lib/ai/intelligence.rb"

module Players
  class Computer < AI

    @@scenarios = []

    include Minimax::InstanceMethods

    def self.scenarios
      @@scenarios
    end
    
  end
end
