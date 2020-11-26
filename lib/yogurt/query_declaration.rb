# typed: strict
# frozen_string_literal: true

module Yogurt
  class QueryDeclaration < T::Struct
    const :container, T.all(Module, QueryContainer)
    const :operations, T::Array[String]
    const :query_text, String
    const :schema, T.class_of(GraphQL::Schema)
  end
end
