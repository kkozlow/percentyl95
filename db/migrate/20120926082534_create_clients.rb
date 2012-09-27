class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :local_graph_id
      t.integer :rra_id

      t.timestamps
    end
  end
end
