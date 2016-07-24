module Enzymator
  module Transformations
    module Object
      class Pipelining < Base

        protected

        def transformer_class
          Enzymator::Transformers::Object::SimplePipeliner
        end

        def interpreted(config)
          config.merge({ stages: config[:stages] || config[:transformations] || [] })
        end

      end
    end
  end
end