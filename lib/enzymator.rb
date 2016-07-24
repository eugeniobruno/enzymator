require 'enzymator/core_ext/categorizer'
require 'enzymator/core_ext/monoids'

require 'enzymator/types/list/functor/enumerable'
require 'enzymator/types/list/foldable/enumerable'
require 'enzymator/types/list/monad/array'

require 'enzymator/transformations/config'
require 'enzymator/transformations/base'
require 'enzymator/transformations/object/application'
require 'enzymator/transformations/object/pipelining'
require 'enzymator/transformations/functor/mapping'
require 'enzymator/transformations/foldable/reduction'
require 'enzymator/transformations/monad/join'

require 'enzymator/transformers/base'
require 'enzymator/transformers/object/simple_applicator'
require 'enzymator/transformers/object/simple_pipeliner'
require 'enzymator/transformers/functor/simple_mapper'
require 'enzymator/transformers/foldable/simple_reducer'
require 'enzymator/transformers/monad/simple_joiner'

require 'enzymator/aggregations/base'
require 'enzymator/aggregations/count'
require 'enzymator/aggregations/sum'
require 'enzymator/aggregations/average'
require 'enzymator/aggregations/merge_hashes'
require 'enzymator/aggregations/mapreduce'
