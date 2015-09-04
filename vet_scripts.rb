require 'roo'
require 'pry'

appointments_hash = Hash.new
appointments_hash_counter = 1

appointments = Roo::Excelx.new('inputs/appointments.xlsx')
appointments_worksheet = appointments.sheet(0)

appointments_worksheet.each(
  name: 'Pet Name',
  date: 'Appointment Date'
  ) do |hash|
  
  hash_key = "id_#{appointments_hash_counter}".to_sym

  appointments_hash[hash_key] = {
    name: hash[:name],
    date: hash[:date]
  }

  appointments_hash_counter += 1
end

appointments_hash.each do |key, value|
  if value[:date] == "Wednesday"
    puts "#{value[:name]} has an appointment on #{value[:date]}."
  end
end
