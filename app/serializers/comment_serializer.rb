class CommentSerializer
  include JSONAPI::Serializer

  set_type :post
  attributes :title
  attributes :content
  attributes :email
end