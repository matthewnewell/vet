require 'roo'
require 'pry'

class Appointments

  def initialize
    @appointments_hash = Hash.new
    @appointments_hash_counter = appointments_hash_counter = 1
  end

  def read_excel_file(file_name)
    workbook = Roo::Excelx.new(file_name)
    @worksheet = workbook.sheet(0)
  end

  def add_excel_data_to_appointments_hash
    @worksheet.each(name: 'Pet Name', date: 'Appointment Date') do |hash|
      hash_key = "id_#{@appointments_hash_counter}".to_sym

      @appointments_hash[hash_key] = {
        name: hash[:name],
        date: hash[:date]
        }

      @appointments_hash_counter += 1
    end
  end

  def report_todays_appointments(date)
    @appointments_hash.each do |key, value|
      if value[:date] == "Wednesday"
        puts "#{value[:name]} has an appointment on #{value[:date]}."
      end
    end
  end
end

check_appointments = Appointments.new
check_appointments.read_excel_file('inputs/appointments.xlsx')
check_appointments.add_excel_data_to_appointments_hash
check_appointments.report_todays_appointments("Wednesday")