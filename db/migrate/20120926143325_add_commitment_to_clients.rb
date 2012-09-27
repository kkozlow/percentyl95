class AddCommitmentToClients < ActiveRecord::Migration
  def change
    add_column :clients, :commitment, :integer
  end
end
