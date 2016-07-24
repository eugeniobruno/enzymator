module Enzymator
  module Transformers
    module Monad
      class SimpleJoiner < Base

        def transform(input)
          input.enzy_join
        end

      end
    end
  end
end