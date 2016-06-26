class DeleteTableApprovalDeveloper < ActiveRecord::Migration
  def change
	drop_table :approvals_developers
  end
end
