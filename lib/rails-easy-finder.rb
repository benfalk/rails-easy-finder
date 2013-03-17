require 'rails-easy-finder/version'
require 'rails-easy-finder/finding_engine'

module Rails
  module Easy
    module Finder

      def it_finds(what,&block)
        finder = Easy::FindingEngine.new(what)
        finder.uses_the_solution &block
        define_method what.to_sym do
          finder.bind self
          finder.results
        end
      end

    end
  end
end
