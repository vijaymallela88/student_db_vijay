class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :name
      t.text :address
      t.string :phone

      t.timestamps
    end
  end
end
