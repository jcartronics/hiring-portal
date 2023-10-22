class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :titulo
      t.text :descripcion
      t.integer :estado, default: 0

      t.timestamps
    end
  end
end
