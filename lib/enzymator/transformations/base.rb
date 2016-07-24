module Enzymator
  module Transformations
    class Base

      @@default_config = {
        max_threads: 1 # TODO: use this value
      }

      def initialize(config = {})
        @config = Config.new(interpreted(@@default_config.merge(config)))
      end

      def run_on_all(*objects)
        # when threads are implemented, the original order must be preserved
        objects.map { |object| run_on(object) }
      end

      def run_on(object)
        Categorizer.categorize(object.class)
        do_run_on(object)
      end

      private

      def interpreted(config)
        config
      end

      def do_run_on(object)
        transformer.transform(object)
      end

      def transformer
        transformer_class.new(@config)
      end

    end
  end
end