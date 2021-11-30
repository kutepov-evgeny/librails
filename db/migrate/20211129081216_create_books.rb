class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.float :price
      t.text :description
      t.integer :subject_id

      t.timestamps
    end
  end

  def up
    create_table :books do |t|
      t.string :title
      t.float :price
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :books
  end

end
