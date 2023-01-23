class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :issue, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
