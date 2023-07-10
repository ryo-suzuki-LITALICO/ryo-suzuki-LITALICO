class MiniFastRecord
    def initialize(records)
        @records = records
    end

    def find(target_id)
        target_record = nil
        left_index = 0
        right_index = @records.length - 1
        while left_index <= right_index
            middle_index = (left_index+right_index)/2
            if @records[middle_index][:id] == target_id
                target_record = @records[middle_index]
                break;
            elsif @records[middle_index][:id] > target_id
                right_index = middle_index - 1
            else
                left_index = middle_index + 1
            end
        end
        target_record
    end
end

class User < MiniFastRecord
end

# records = [ { id: 1, name: 'number_1' }, { id: 2, name: 'number_2' }, { id: 3, name: 'number_3' } ];
max_id = 10**6
records = (1..max_id).map{ |i| {id: i, name: "number_#{i}"} };
user = User.new(records);

start_time = Time.now
p user.find(max_id);
p "処理概要 #{Time.now - start_time}s"
