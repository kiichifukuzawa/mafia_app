class User < ApplicationRecord
  validates :email, {presence: true, uniquenss: true}
end
