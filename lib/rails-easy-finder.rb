require 'rails-easy-finder/version'
require 'rails-easy-finder/finding_engine'
require 'rails-easy-finder/finding_adapter'

module Rails
  module Easy
    module Finder

      def it_finds(what,&block)
        adapter = Easy::FindingAdapter.new what
        finder = Easy::FindingEngine.new adapter.scope
        finder.uses_the_solution &block
        define_method adapter.method do
          finder.bind self
          finder.results
        end
      end

    end
  end
end
