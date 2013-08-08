class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :book, index: true
      t.references :user, index: true
      t.string :comment

      t.timestamps
    end
  end
end
