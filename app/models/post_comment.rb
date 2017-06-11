class PostComment < ApplicationRecord
  belongs_to :post
  #「optional: true」とすることで、関連先のオブジェクトが存在するかの検証をOFFにできる。
  #これによって、user_id,owner_idをnilで保存できるようにした。
  belongs_to :user, optional: true
  belongs_to :owner, optional: true

  def get_nickname
    if self.user_id.present?
      self.user.nickname
    else
      self.owner.nickname
    end
  end
end
