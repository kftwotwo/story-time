class User < ApplicationRecord
  has_secure_password
  has_many :stories
  has_many :posts, :through => :stories
end
