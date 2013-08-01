class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :path
      t.string :text
      t.references :book, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
