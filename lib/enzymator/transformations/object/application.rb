module Enzymator
  module Transformations
    module Object
      class Application < Base

        protected

        def transformer_class
          Enzymator::Transformers::Object::SimpleApplicator
        end

      end
    end
  end
end