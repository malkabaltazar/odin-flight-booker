# Airports
['ATL', 'LAX', 'ORD', 'DFW', 'DEN',
  'JFK', 'SFO', 'LAS'].each do |code|
  Airport.create!(airport: code)
end

# Flights
100.times do
  from_airport = to_airport = rand(1..8)
  while from_airport == to_airport
    to_airport = rand(1..8)
  end
  Flight.create!(from_airport: Airport.find(from_airport),
               to_airport: Airport.find(to_airport),
               start: rand(5..10).months.from_now,
               duration: rand(100..400))
end
