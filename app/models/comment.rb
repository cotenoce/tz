class Comment < ActiveRecord::Base
  validates :name, presence: true, format: { with: /\A[[:upper:]][[:alpha:]]+\s[[:upper:]][[:alpha:]]{1,}.*\.\z/ }
  validates :body, presence: true

  def owner
    owner_type.constantize.find(owner_id)
  end
end
