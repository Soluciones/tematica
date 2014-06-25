class AddPublicadoToTematica < ActiveRecord::Migration
  def change
    add_column :tematica_tematicas, :publicado, :boolean, default: true
  end
end
