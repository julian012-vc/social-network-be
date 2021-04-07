class CommentSerializer
  include JSONAPI::Serializer

  set_type :post
  attributes :title
  attributes :content
  attributes :email
  attributes :created_at
  attributes :post_id
end