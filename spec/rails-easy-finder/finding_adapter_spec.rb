require "#{File.dirname(__FILE__)}/../spec_helper"

# Stub Testing Class for adapter
class TestyTest
  class << self
    def scoped
      self
    end
  end
end

module Rails
  module Easy

    describe FindingAdapter do

      context 'when given a symbol' do

        before :each do
          @adapter = Easy::FindingAdapter.new :testy_tests
        end

        it 'attempts to find a class for scope' do
          @adapter.scope.should be(TestyTest)
        end

        it 'will pass along the symbol as the method name' do
          @adapter.method.should be(:testy_tests)
        end

      end

      context 'when given a string' do

        before :each do
          @adapter = Easy::FindingAdapter.new 'testy_test'
        end

        it 'attempts to find a class for scope' do
          @adapter.scope.should be(TestyTest)
        end

        it 'will pass along the symbol as the method name' do
          @adapter.method.should be(:testy_tests)
        end

      end

      context 'when given a class' do

        before :each do
          @adapter = Easy::FindingAdapter.new TestyTest
        end

        it 'attempts to find a class for scope' do
          @adapter.scope.should be(TestyTest)
        end

        it 'will pass along the symbol as the method name' do
          @adapter.method.should be(:testy_tests)
        end

      end




    end

  end
end