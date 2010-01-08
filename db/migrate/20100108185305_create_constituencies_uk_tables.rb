
class CreateConstituenciesUkTables < ActiveRecord::Migration

  # Consituency examples:
  # - Constituency: Aldershot
  # - Region: South East England
  # - Country: England
  # 
  # - Constituency: Aberavon
  # - Region: Wales
  # - Country: Wales

  def self.up
    create_table :uk_countries do |t|
      t.string :name
      t.string :wikipedia_uri
    end
      
    create_table :uk_regions do |t|
      t.string :name
      t.string :wikipedia_uri
      t.integer :uk_country_id
    end

    create_table :uk2010_constituencies do |t|
      t.string :name
      t.string :alternate_name
      t.string :wikipedia_uri
      t.integer :uk_country_id
      t.integer :uk_region_id
    end
    
    add_index :uk_regions, :uk_country_id
    add_index :uk2010_constituencies, :uk_country_id
    add_index :uk2010_constituencies, :uk_region_id
    
  end

  def self.down
    drop_table :uk_countries
    drop_table :uk_regions
    drop_table :uk2010_constituencies
  end
end
