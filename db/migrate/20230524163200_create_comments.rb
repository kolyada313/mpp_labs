class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :user, foreign_key: { to_table: :users }
      t.references :commented_user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
