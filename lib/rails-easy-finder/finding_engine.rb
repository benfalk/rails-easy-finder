module Rails
  module Easy

    # Generates a finder set to be used
    class FindingEngine < Object

      def initialize(&block)
        @scopes = []
        instance_eval &block
      end

      private

      def matches_param_predicate?(term)
        term.to_s =~ /^the_|^of_the_|^for_the_/
      end

      def build_param_predicate(param)
        define_singleton_method "the_#{param}" do |field = nil|
          field ? "#{param}.#{field}" : param.to_s
        end
      end

      def method_missing(method,*parms)
        if matches_param_predicate? method
          method.to_s =~ /the_([_a-z]*)/
          build_param_predicate $1.to_sym

        else
          @scopes << [method,parms]
          p @scopes
        end
      end

    end

  end
end