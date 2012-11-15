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
      mark=''
      (0..3).each do |num|

      
      
        if exact_match?(guess, num)
          mark << '+'
        end
      end
      (0..3).each do |num|
        if number_match?(guess, num)
          mark << '-'
        end
      end
      @output.puts mark
    end
  
    private
    def exact_match?(guess,index)
      @secret[index]==guess[index]
    end
    
    def number_match?(guess,index)
      @secret.include?(guess[index]) && !exact_match?(guess, index)

    end
  end
end
