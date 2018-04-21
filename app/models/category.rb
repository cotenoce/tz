class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, -> { where owner_type: 'Category' }, foreign_key: "owner_id", dependent: :destroy
  validates :name, presence: true, format: { with: /\A[[:upper:]][[:alpha:]]+\s[[:alpha:]]{2,}.*\.\z/ }
end
