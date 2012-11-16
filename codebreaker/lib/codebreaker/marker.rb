class Marker
      def initialize(secret, guess)
        @secret = secret
        @guess = guess
      end


      def exact_match_count
        (0..3).inject(0) do |count, index|
          count + (exact_match?(@guess, index) ? 1 : 0)
        end
      end

      def number_match_count
        number_match_count = 0
        (0..3).each do |index|
          if number_match?(@guess, index)
            number_match_count += 1
          end
        end
        number_match_count
      end

      private

      def exact_match?(guess,index)
        @secret[index]==guess[index]
      end

      def number_match?(guess,index)
        @secret.include?(guess[index]) && !exact_match?(guess, index)

      end
    end
