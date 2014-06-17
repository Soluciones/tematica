class CreateCosas < ActiveRecord::Migration
  def change
    create_table :cosas do |t|
      t.string :nombre
      t.string :permalink

      t.timestamps
    end
  end
end
