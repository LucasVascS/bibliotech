class AddRefenrenceBookToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :created_by_id, :integer
  end
end
