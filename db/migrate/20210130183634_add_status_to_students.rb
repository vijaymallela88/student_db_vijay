class AddStatusToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :status, :string
  end
end
