class Comment < ActiveRecord::Base
  def owner
    owner_type.constantize.find(owner_id)
  end
end
