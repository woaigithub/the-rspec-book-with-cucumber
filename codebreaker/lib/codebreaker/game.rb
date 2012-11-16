module Codebreaker
  class Game
    def initialize(output)
      @output=output
    end

    def start(secret)
      @output.puts "Welcome to Codebreaker!"
      @output.puts "Enter guess:"
      @secret = secret
    end
  
    def guess(guess)
      @output.puts '+'*exact_match_count(guess)+'-'*number_match_count(guess)
    end
  
    private

    def exact_match_count(guess)
      (0..3).inject(0) do |count, index|
        count + (exact_match?(guess, index) ? 1 : 0)
      end
    end

 
    def number_match_count(guess)
      number_match_count = 0
      (0..3).each do |index|
        if number_match?(guess, index)
          number_match_count += 1
        end
      end
      number_match_count
    end
    def exact_match?(guess,index)
      @secret[index]==guess[index]
    end
    
    def number_match?(guess,index)
      @secret.include?(guess[index]) && !exact_match?(guess, index)

    end
  end
end
