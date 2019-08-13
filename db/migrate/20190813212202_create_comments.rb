class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content_body
      t.belongs_to :user, index: true
      t.belongs_to :photo, index: true
    end
  end
end
