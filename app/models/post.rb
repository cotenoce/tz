class Post < ActiveRecord::Base
  belongs_to :category
	has_many :comments, -> { where owner_type: 'Post' }, foreign_key: "owner_id", dependent: :destroy
	validates :title, presence: true, format: { with: /\A[[:upper:]][[:alpha:]]+\s[[:alpha:]]{2,}.*\.\z/ }
	validates :body,  presence: true
end
