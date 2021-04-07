class ReactionSerializer
  include JSONAPI::Serializer

  attributes :post_id
  attributes :type_reaction
end