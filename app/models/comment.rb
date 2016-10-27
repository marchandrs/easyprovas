class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def getUserName
    if self.user_id.nil?
      @user = User.getAnonymousUser
    else
      @user = User.find(self.user_id)
    end
    @user.name
  end
end
