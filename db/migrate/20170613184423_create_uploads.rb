class CreateUploads < ActiveRecord::Migration[5.1]
  def change
    table = :uploads
    create_table table do |t|
      t.timestamps
    end unless table_exists?(table)

    add_index(table, :created_at) unless index_exists?(table, :created_at)

    add_column(table, :user_id, :integer, null: false, default: nil) unless column_exists?(table, :user_id)
    add_index(table, :user_id) unless index_exists?(table, :user_id)
  end
end
