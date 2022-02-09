class CreateJrbooks < ActiveRecord::Migration[6.1]
  def change
    create_table :jrbooks do |t|
      t.string :name
      t.string :author
      t.boolean :read, default: false
      t.string :book_rating

      t.timestamps
    end
  end
end
