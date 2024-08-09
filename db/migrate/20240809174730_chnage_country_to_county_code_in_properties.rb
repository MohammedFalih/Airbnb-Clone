class ChnageCountryToCountyCodeInProperties < ActiveRecord::Migration[7.2]
  def change
    rename_column :properties, :country, :country_code
  end
end
