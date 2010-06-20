Factory.define :washing_station do |washing_station|
  washing_station.name      "Washing Station 1"
  washing_station.code      "abcabc123"
end

Factory.define :organic_certifier do |organic_certifier|
  organic_certifier.name      "Organic Certifier 1"
  organic_certifier.code      "123abced"
end

Factory.define :farmer do |farmer|
  farmer.name       "A Farmer"
  farmer.association :washing_station
end

Factory.define :farm do |farm|
  farm.name         "Farm A"
  farm.organic      true
  farm.latitude     -77.23
  farm.longitude    -15.0
  farm.altitude     150
  farm.association :organic_certifier
  farm.association :farmer
end