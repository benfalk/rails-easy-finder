module Rails
  module Easy

    # Generates a finder set to be used
    class FindingEngine < Object

      def initialize(scope,binding = nil,&block)
        @scope = scope
        bind binding if binding
        uses_the_solution &block if block_given?
      end

      def bind(obj)
        @bind = obj
      end

      def uses_the_solution(&block)
        @solution = block
      end

      def results
        @scoped = @scope.scoped
        instance_eval &@solution
        @scoped
      end

      private

      def matches_param_predicate?(term)
        term.to_s =~ /^the_|^of_the_|^for_the_/
      end

      def build_param_predicate(param)
        define_singleton_method "the_#{param}" do |field = nil|
          field ? @bind.send(param).send(field) : @bind.send(param)
          #field ? "#{param}.#{field}" : param.to_s
        end
        singleton_class.class_eval do
          alias_method "of_the_#{param}", "the_#{param}"
          alias_method "for_the_#{param}", "the_#{param}"
        end
      end

      def method_missing(method,*parms)
        if matches_param_predicate? method
          method.to_s =~ /the_([_a-z]*)/
          build_param_predicate $1.to_sym
          send "the_#{$1}", *parms
        else
          @scoped = @scoped.send method, *parms
        end
      end

    end

  end
end