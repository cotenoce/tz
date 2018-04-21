class Post < ActiveRecord::Base
	has_many :comments, -> { where owner_type: 'Post' }, foreign_key: "owner_id", dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
	validates :body,  presence: true
end