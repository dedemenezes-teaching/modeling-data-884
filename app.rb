require_relative 'room_repository'
require_relative 'patient_repository'

room_repo = RoomRepository.new('rooms.csv')
patient_repo = PatientRepository.new('patients.csv', room_repo)

patient_repo.all.each do |patient|
  puts "#{patient.name} is in room #{patient.room.id}"
end
