class PostSerializer
  include JSONAPI::Serializer

  attributes :title
  attributes :content
  attributes :email
  attributes :total_likes
  attributes :total_dislikes
  attributes :total_comments
  attributes :created_at

  has_many :comments
end
