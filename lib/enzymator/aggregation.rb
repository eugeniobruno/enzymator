module Enzymator
  class Aggregation

    @@single_cluster_config = {
      initial_clusters: lambda { |n| n },
      enumerator:       lambda { |n| [n].each },
      map_each:         lambda { |n| :single_cluster },
      reduce_each:      lambda { |acum, n| :single_cluster },
    }

    attr_accessor :config, :results

    def initialize(config, results = [])
      @config = @@single_cluster_config.merge(config)
      @results = results
    end

    def last_result
      results.last
    end
    alias :result :last_result

    def patch_config(config_patch)
      self.config = config.merge(config_patch)
      self
    end

    def run_on!(enumerable, options = {}, config = @config)
      add_result(run_on(enumerable, options, config))
      self
    end

    def run_on(enumerable, options = {}, config = @config)
      config[:initial_clusters].call(enumerable).reduce(config[:null_result].call) do |acum, cluster|
        group = config[:map].call(cluster)
        config[:reduce].call( acum, group, aggregate(cluster, config, options) )
      end
    end

    protected

    def add_result(result)
      @results.push(result)
      self
    end

    def aggregate(cluster, config, options)
      enum             = config[:enumerator].call(cluster)
      first_element    = enum.peek
      first_map_result = config[:map_each].call(first_element)

      enum.skip(1).reduce(first_map_result) do |acum, e|
        step(acum, e, config, options)
      end
    end

    def step(previous_result, elem, config, options)
      map_result = config[:map_each].call(elem)
      config[:reduce_each].call(previous_result, map_result)
    end

  end
end