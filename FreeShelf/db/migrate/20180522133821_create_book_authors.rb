class CreateBookAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :book_authors do |t|
      t.references :book
      t.references :author

      t.timestamps
    end
  end
end
