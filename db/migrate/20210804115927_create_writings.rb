class CreateWritings < ActiveRecord::Migration[6.1]
  def change
    create_table :writings do |t|
      t.integer :author_id
      t.integer :book_id
    end

    add_index :writings, [:author_id, :book_id], unique: true
  end
end
