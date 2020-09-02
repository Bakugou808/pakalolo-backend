class CommentSerializer < ActiveModel::Serializer
  attributes :id, :likes, :rating, :comment, :created_at, :user, :comments, :commentable, :username, :commentable_type, :commentable_id
  belongs_to :user 
  # belongs_to :strain, as: :commentable 
  # belongs_to :comment, as: :commentable 
  has_many :likes, as: :likeable 
end
