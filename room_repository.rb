require 'csv'
require_relative 'room'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file = csv_file_path
    @rooms = []
    load_csv
  end

  def all
    @rooms
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  def add_room(room)
    # @rooms is [], id should be 1
    # @rooms has any room, @rooms.last.id + 1
    next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
    room.id = next_id
    @rooms << room
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row,  header_converters: :symbol) do |row|
      # 1st ITERATION
      # row[:id] => "1"
      # row[:capacity] => "2"

      # 2nd iteration
      # row[:id] => "2"
      # row[:capacity] => "10"

      # Reminder....
      # Data come from CSV as string
      # Maybe we need to convert them into, Integer, Boolean, Instances....
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i

      @rooms << Room.new(row)
    end
  end
end
