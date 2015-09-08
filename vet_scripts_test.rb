require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'vet_scripts'

class AppointmentsTest < MiniTest::Test
  def test_appointment_is_an_object_from_the_Appointments_class
    appointment = Appointments.new 
    assert_equal appointment.class, Appointments
    assert_equal appointment.class.class, Class 
  end

  def test_appointment_initialized_instance_variables
    appointment = Appointments.new
    assert_equal appointment.instance_variables, [:@appointments_hash, :@appointments_hash_counter]
  end

  def test_appointment_reads_an_excel_file_into_a_roo_object_and_makes_an_instance_variable_of_first_worksheet
    appointment = Appointments.new
    appointment.read_excel_file('inputs/appointments.xlsx')
    assert_equal appointment.instance_variables[2], :@worksheet
  end

  def test_add_excel_data_to_appointments_hash
    appointment = Appointments.new
    appointment.read_excel_file('inputs/appointments.xlsx')
    appointment.add_excel_data_to_appointments_hash
    assert_equal appointment.instance_variable_get(:@appointments_hash).first, 
    [:id_1, {:name=>"Pet Name", :date=>"Appointment Date"}]
  end

  def test_hash_key_is_a_symbol
    appointment = Appointments.new
    appointment.read_excel_file('inputs/appointments.xlsx')
    appointment.add_excel_data_to_appointments_hash
    appointment_hash = appointment.instance_variable_get(:@appointments_hash)
    assert_equal appointment_hash.keys.first.class, Symbol
  end

  def test_hash_key_starts_with_id_
    appointment = Appointments.new
    appointment.read_excel_file('inputs/appointments.xlsx')
    appointment.add_excel_data_to_appointments_hash
    appointment_hash = appointment.instance_variable_get(:@appointments_hash)
    assert_equal appointment_hash.keys.first[0,3], "id_"
  end


  def test_hash_key_increments_by_one
    appointment = Appointments.new
    appointment.read_excel_file('inputs/appointments.xlsx')
    appointment.add_excel_data_to_appointments_hash
    appointment_hash = appointment.instance_variable_get(:@appointments_hash)
    assert_equal appointment_hash.keys[0], :id_1
    assert_equal appointment_hash.keys[1], :id_2
    assert_equal appointment_hash.keys[2], :id_3
    assert_equal appointment_hash.keys[3], :id_4
    assert_equal appointment_hash.keys[4], :id_5
    assert_equal appointment_hash.keys[5], :id_6
    assert_equal appointment_hash.keys[6], :id_7
  end

  def test_report_todays_appointments
    appointment = Appointments.new
    appointment.read_excel_file('inputs/appointments.xlsx')
    appointment.add_excel_data_to_appointments_hash
    assert_equal appointment.report_todays_appointments("Wednesday"), 
    ["Rex has an appointment on Wednesday.", 
     "Mittens has an appointment on Wednesday."]
  end

end
