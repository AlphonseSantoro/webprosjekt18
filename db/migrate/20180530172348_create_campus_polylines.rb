class CreateCampusPolylines < ActiveRecord::Migration[5.1]
  def change
    create_table :campus_polylines do |t|
      t.string :campus
      t.string :store
      t.text :polyline
      t.text :bounds

      t.timestamps
    end
  end
end
