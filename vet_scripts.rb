require 'roo'
require 'pry'

appointments_hash = Hash.new

appointments = Roo::Excelx.new('inputs/appointments.xlsx')
appointments_worksheet = appointments.sheet(0)

appointments_worksheet.each(
  name: 'Pet Name',
  date: 'Appointment Date'
  ) do |hash|
  
  hash_key = hash[:name]

  appointments_hash[hash_key] = {
    name: hash[:name],
    date: hash[:date]
  }
end

binding.pry

# Try these commands in pry.
# 
# appointments_hash
# appointments_hash["Rex"]
# appointments_hash["Rex"][:date]

