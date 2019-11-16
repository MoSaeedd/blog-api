class User < ApplicationRecord
   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_secure_password
   validates_presence_of :name, :email, :password_digest
end
