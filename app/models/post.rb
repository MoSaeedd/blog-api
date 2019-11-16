class Post < ApplicationRecord
  belongs_to :user
  has_many :tags,  dependent: :destroy
  has_many :comments,  dependent: :destroy
  validates_presence_of :title, :body
end
