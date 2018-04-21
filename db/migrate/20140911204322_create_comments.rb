class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.string :owner_type
      t.references :owner, index: true

      t.timestamps
    end
  end
end
