class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :name
      t.string :login
      t.string :password_digest
      t.string :url
      t.text :restrictions
      t.references :user, index: true, foreign_key: true
    end
  end
end
