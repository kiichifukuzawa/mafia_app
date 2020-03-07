class Post < ApplicationRecord
  # 空の投稿をはじく,文字数の上限
  validates :content, {presence: true, length: {maximum: 140}}
  # user_idがからの状態で保存更新されないようする
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

end
