module Enzymator
  module Transformations
    module Foldable
      class Reduction < Base

        protected

        def transformer_class
          Enzymator::Transformers::Foldable::SimpleReducer
        end

        def interpreted(config)
          config.merge({
            append: config[:append] || config[:reduction] || :mappend,
            empty:  config[:empty]  || config[:initial]   || :mempty
          })
        end

      end
    end
  end
end