require 'pry'

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}


def find_pigeon_names(pigeon_data)
  pigeon_names = []
  pigeon_data.values.map do |keys| 
    pigeon_names = keys.values.flatten!
  end 
  pigeon_names 
  # returns ["Theo", "Queenie", "Alex", "Ms. K", 
  # "Lucky", "Peter Jr.", "Andrew"]
end 

def creates_hash_for_pigeons(pigeon_data)
  pigeon_list = {}
  pigeon_names = find_pigeon_names(pigeon_data)
  pigeon_names.each do |name|
    pigeon_list[name] = {}
  end
  pigeon_list
 #  return {"Theo"=>{},
 # "Queenie"=>{},
 # "Alex"=>{},
 # "Ms. K"=>{},
 # "Lucky"=>{},
 # "Peter Jr."=>{},
 # "Andrew"=>{}}
end

def adds_array_to_pigeon_hash(pigeon_data)
  pigeon_names = find_pigeon_names(pigeon_data)
  pigeon_list = creates_hash_for_pigeons(pigeon_data)
  info_array = []
  pigeon_data.keys.each do |key| 
    pigeon_names.each do |name| 
      pigeon_list[name][key] = info_array
    end 
  end 
  pigeon_list
 #  returns {"Theo"=>{:color=>[], :gender=>[], :lives=>[]},
 # "Queenie"=>{:color=>[], :gender=>[], :lives=>[]},
 # "Alex"=>{:color=>[], :gender=>[], :lives=>[]},
 # "Ms. K"=>{:color=>[], :gender=>[], :lives=>[]},
 # "Lucky"=>{:color=>[], :gender=>[], :lives=>[]},
 # "Peter Jr."=>{:color=>[], :gender=>[], :lives=>[]},
 # "Andrew"=>{:color=>[], :gender=>[], :lives=>[]}}
end 

def return_color_array(name, pigeon_data)
  pigeon_data[:color].select do |color, names|
    names.include?(name)
  end.keys.map { |key| key.to_s  }
end

def return_gender_array(name, pigeon_data)
  pigeon_data[:gender].select do |color, names|
    names.include?(name)
  end.keys.map { |key| key.to_s  }
end

def return_location_array(name, pigeon_data)
  pigeon_data[:lives].select do |color, names|
    names.include?(name)
  end.keys.map { |key| key.to_s  }
end

def nyc_pigeon_organizer(pigeon_data)
  pigeon_names = find_pigeon_names(pigeon_data)
  pigeon_list = adds_array_to_pigeon_hash(pigeon_data)
  pigeon_list.each do |name, hash_of_data|
    hash_of_data[:color] = return_color_array(name, pigeon_data)
    hash_of_data[:gender] = return_gender_array(name, pigeon_data)
    hash_of_data[:lives] = return_location_array(name, pigeon_data)
  end 
end


