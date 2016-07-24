module Enzymator
  module Transformations
    module Monad
      class Join < Base

        protected

        def transformer_class
          Enzymator::Transformers::Monad::SimpleJoiner
        end

      end
    end
  end
end