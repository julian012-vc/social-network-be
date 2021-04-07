class Post < ApplicationRecord
  has_many :reactions

  belongs_to :post, class_name: 'Post', optional: true
  has_many :comments, class_name: 'Post', foreign_key: 'post_id'

  def total_likes
    reactions.where(type_reaction: 'L').count
  end

  def total_dislikes
    reactions.where(type_reaction: 'D').count
  end

  def total_comments
    comments.count
  end
end
