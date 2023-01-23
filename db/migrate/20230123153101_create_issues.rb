class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :no
      t.string :title
      t.string :description
      t.string :assigned_to
      t.string :status

      t.timestamps
    end
  end
end
