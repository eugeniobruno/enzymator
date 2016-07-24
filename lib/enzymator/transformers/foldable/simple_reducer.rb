module Enzymator
  module Transformers
    module Foldable
      class SimpleReducer < Base

        def transform(input)
          input.enzy_fold(@config.empty, @config.append)
        end

      end
    end
  end
end