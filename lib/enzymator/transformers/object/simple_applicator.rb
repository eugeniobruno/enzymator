module Enzymator
  module Transformers
    module Object
      class SimpleApplicator < Base

        def transform(input)
          @config.function.call(input)
        end

      end
    end
  end
end