class PostSerializer
  include JSONAPI::Serializer

  attributes :title
  attributes :content
  attributes :email
  attributes :total_likes
  attributes :total_dislikes
  attributes :total_comments
  attributes :created_at
  attributes :post_id

  has_many :comments
end
