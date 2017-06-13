class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    table = :users
    create_table table do |t|
      t.timestamps
    end unless table_exists?(table)

    add_index(table, :created_at) unless index_exists?(table, :created_at)

    add_column(table, :email, :text, null: false, default: nil) unless column_exists?(table, :email)
    add_index(table, :email, unique: true) unless index_exists?(table, :email)

    add_column(table, :password_digest, :text, null: false, default: nil) unless column_exists?(table, :password_digest)
  end
end
