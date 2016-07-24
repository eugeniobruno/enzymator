module Enzymator
  module Transformations
    module Functor
      class Mapping < Base

        protected

        def transformer_class
          Enzymator::Transformers::Functor::SimpleMapper
        end

        def interpreted(config)
          config.merge({ map: config[:map] || config[:mapping] })
        end

      end
    end
  end
end