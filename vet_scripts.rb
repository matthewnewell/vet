require 'roo'
require 'pry'

appointments = Roo::Excelx.new('inputs/appointments.xlsx')

appointments_worksheet = appointments.sheet(0)

appointments_worksheet.each(
  name: 'Pet Name',
  date: 'Appointment Date'
  ) do |hash|
  puts hash.inspect
  binding.pry
end


