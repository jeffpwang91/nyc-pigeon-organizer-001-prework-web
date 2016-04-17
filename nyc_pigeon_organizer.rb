require 'pry'

def nyc_pigeon_organizer(data)
  pigeon_list = {}
  names_array = []
  new_array = []
  theo_hash = {}
  data.each do |category, values|
    if category == :gender
      values.each { |gender, arrays|
        arrays.each do |names|
          names_array << names
        end
         }
    elsif category == :color
      values.each do |color, names|
         if  names.include?("Theo")
           new_array << color.to_s
         end
      end
      theo_hash[:color] = new_array
    end
  end

  names_array.each do |name|
    if name == "Theo"
      pigeon_list[name] = theo_hash
    end
  end
end

nyc_pigeon_organizer({
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  }
  } )