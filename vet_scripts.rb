require 'roo'
require 'pry'

appointments = Roo::Excelx.new('inputs/appointments.xlsx')

binding.pry

# Try these commands in pry. Type 'exit' to get out of pry.
# appointments
# appointments.class
# appointments.info
# appointments.sheet(0)
# appointments.sheet(0).row(1)

# More advanced users
# appointments.methods
# cd appointments 
# ls  --> displays object's instance variables