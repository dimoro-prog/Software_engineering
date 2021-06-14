class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :points
      t.string :letter

      t.timestamps
    end
  end
end
