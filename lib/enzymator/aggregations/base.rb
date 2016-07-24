module Enzymator
  module Aggregations
    class Base

      def initialize(config = {})
        @config = Transformations::Config.new(config)
      end

      def run_on(object)
        @transformation.run_on(object)
      end

    end
  end
end