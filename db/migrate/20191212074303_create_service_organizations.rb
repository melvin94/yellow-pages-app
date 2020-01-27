class CreateServiceOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :service_organizations do |t|
      t.string :organization
      t.text :address
      t.text :number
      t.string :website
      t.text :hours
      t.references :service_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
