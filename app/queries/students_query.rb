class StudentsQuery
    attr :relation, :student_name, :institution_name, :sort_by, :direction, :action

    def initialize(relation, params)
        @relation = relation
        @student_name = params[:student_name]
        @institution_name = params[:institution_name]
        @sort_by = params[:sort]
        @direction = params[:direction]
        @action = params[:action]
    end
    
    def self.call(relation, params)
        new(relation, params).call
    end

    def call
        result = search_relation if student_name.present? && institution_name.present?
        result = search
        result = sort(result) if sort_by || direction
        
        result
      end

    def all
        if @action == "pending_students"
          relation.joins(:institution).where(:status => "pending")
        else
          relation.joins(:institution).where(:status => "created")
        end
    end

    def search
        result = all
        result = all.where('LOWER(students.full_name) LIKE ?', "%#{student_name.downcase}%") if student_name.present?
        result = all.where('LOWER(institutions.name) LIKE ?', "%#{institution_name.downcase}%") if institution_name.present?
        
        result
    end

    def search_relation
        all.where('LOWER(students.full_name) LIKE ? AND LOWER(institutions.name) LIKE ?', "%#{student_name.downcase}%", "%#{institution_name.downcase}%")
    end

    def sort(result)
        sort = "#{sort_by} #{direction}"

        result.order(sort)
    end
end