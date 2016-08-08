class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def getUserName
    @user ||= User.find(self.user_id)
    @user.name
  end
end
