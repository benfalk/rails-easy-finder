require 'spec_helper'

module Rails
  module Easy
    describe Finder do

      context 'when extended in a class' do

        before :each do
          @class = Class.new do
            extend Rails::Easy::Finder
          end
          @scope = double('scope')
          @scope.as_null_object
        end

        describe 'the "it_finds" method' do

          it 'should exist as a singleton method' do
            @class.should respond_to(:it_finds)
          end

          context 'when given a scope' do
            before :each do
              @scope.should_receive(:to_sym).and_return(:people)
            end

            it 'creates a finder method for an instance' do
              @class.it_finds @scope
              @new = @class.new
              @new.should respond_to :people
            end

            it 'should use the object data' do
              @scope.should_receive(:scoped).and_return(@scope)
              @scope.should_receive(:tested_by).with('test').and_return(@scope)
              @class.send( :define_method, :doctor ) do
                'test'
              end
              @class.it_finds @scope do
                tested_by the_doctor
              end
              @new = @class.new
              @new.people.should be(@scope)
            end

          end
        end

      end

    end
  end
end