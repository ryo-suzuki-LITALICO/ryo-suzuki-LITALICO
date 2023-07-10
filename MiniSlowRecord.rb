class MiniSlowRecord
    def initialize(records)
        @records = records
    end

    def find(target_id)
        @records.find do |record|
            record[:id] == target_id
        end
    end
end

class User < MiniSlowRecord
end

# records = [ { id: 1, name: 'number_1' }, { id: 2, name: 'number_2' }, { id: 3, name: 'number_3' } ];
max_id = 10**6
records = (1..max_id).map{ |i| {id: i, name: "number_#{i}"} };
user = User.new(records);

start_time = Time.now
p user.find(max_id);
p "処理概要 #{Time.now - start_time}s"
