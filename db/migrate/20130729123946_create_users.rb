class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :password_digest
      t.references :rank

      t.timestamps
    end
  end
end
