class CreateApprovalsDevelopers < ActiveRecord::Migration
  def change
    create_table :approvals_developers do |t|
	t.integer :approval_id
	t.integer :organizer_id
    end
  end
end
