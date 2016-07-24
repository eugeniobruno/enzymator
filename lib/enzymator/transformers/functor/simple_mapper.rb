module Enzymator
  module Transformers
    module Functor
      class SimpleMapper < Base

        def transform(input)
          input.enzy_fmap(@config.map)
        end

      end
    end
  end
end