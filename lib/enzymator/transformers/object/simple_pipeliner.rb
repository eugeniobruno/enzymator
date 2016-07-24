module Enzymator
  module Transformers
    module Object
      class SimplePipeliner < Base

        def transform(input)
          @config.stages.reduce(input) { |acum, stage| stage.run_on(acum) }
        end

      end
    end
  end
end