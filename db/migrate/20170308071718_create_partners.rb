class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string 'name', null: false
      t.string 'url'

      t.timestamps
    end
  end
end
