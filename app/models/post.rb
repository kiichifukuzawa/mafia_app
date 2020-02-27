class Post < ApplicationRecord
  # 空の投稿をはじく,文字数の上限
  validates :content, {presence: true, length: {maximum: 140}}
end
