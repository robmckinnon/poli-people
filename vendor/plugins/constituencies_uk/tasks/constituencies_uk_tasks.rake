namespace :constituencies_uk do

  def add_constituency attributes, values
    constituency = nil
    region = nil

    puts attributes.inspect
    attributes.each_with_index do |attribute, index|
      value = values[index]
      case attribute
        when 'name'
          # puts "loading: #{value}"
          constituency = Uk2010Constituency.find_or_create_by_name(value)
        when 'region'
          region = UkRegion.find_or_create_by_name(value)
          constituency.uk_region_id = region.id
        when 'country'
          country = UkCountry.find_or_create_by_name(value)
          constituency.uk_country_id = country.id
          unless region.uk_country_id
            region.uk_country_id = country.id
            region.save!
          end
        when 'alternate_name'
          constituency.alternate_name = value
        when 'wikipedia_uri'
          puts value
          constituency.wikipedia_uri = value
      end
    end
    constituency.save!
  end
  
  def load_constituencies data
    attributes = []
    first_line = true
    data.each_line do |line|
      if first_line
        attributes = line.strip.split("\t")
        first_line = false
      else
        add_constituency attributes, line.strip.split("\t")
      end
    end
  end

  desc "loads constituency data"
  task :load_data => [:environment] do
    if true # UkCountry.count == 0
      file = File.join(File.dirname(__FILE__), "..", "data", "constituencies_uk_2010.tsv")
      puts "loading data: #{file}"
      data = IO.read(file)
      load_constituencies data
    end
  end

end
