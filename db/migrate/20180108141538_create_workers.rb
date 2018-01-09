class CreateWorkers < ActiveRecord::Migration
  def up
    create_table :workers do |t|
      t.string :fio
      t.string :email
      t.string :phone
      t.string :photo_url
      t.text :info

      t.timestamps
    end

    create_table :cities do |t|
      t.belongs_to :workers, index: true
      t.string :city_name

      t.timestamps
    end

    create_table :professions do |t|
      t.belongs_to :workers, index: true
      t.string :prof_name

      t.timestamps
    end

  end
end
