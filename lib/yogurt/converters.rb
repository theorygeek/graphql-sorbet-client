# typed: strict
# frozen_string_literal: true

module Yogurt
  module Converters
    class Date
      extend T::Sig
      extend ScalarConverter

      sig {override.returns(T::Types::Base)}
      def self.type_alias
        T.type_alias {::Date}
      end

      sig {override.params(value: ::Date).returns(String)}
      def self.serialize(value)
        value.iso8601
      end

      sig {override.params(raw_value: SCALAR_TYPE).returns(::Date)}
      def self.deserialize(raw_value)
        raise "Unexpected value returned for Date: #{raw_value.inspect}" if !raw_value.is_a?(String)

        ::Date.iso8601(raw_value)
      end
    end

    class Time
      extend T::Sig
      extend ScalarConverter

      sig {override.returns(T::Types::Base)}
      def self.type_alias
        T.type_alias {::Time}
      end

      sig {override.params(value: ::Time).returns(String)}
      def self.serialize(value)
        value.iso8601
      end

      sig {override.params(raw_value: SCALAR_TYPE).returns(::Time)}
      def self.deserialize(raw_value)
        raise "Unexpected value returned for Time: #{raw_value.inspect}" if !raw_value.is_a?(String)

        ::Time.iso8601(raw_value)
      end
    end
  end
end
