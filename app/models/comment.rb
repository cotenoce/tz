class Comment < ActiveRecord::Base
  validates :name, presence: true
  validates :body, presence: true

  def owner
    owner_type.constantize.find(owner_id)
  end
end
