class StudentsQuery
  attr :relation

    def initialize(relation)
        @relation = relation
    end

    def self.call(relation)
        new(relation).call
    end

    private

    def call
        relation.includes(:institution).where(:status => "created")
    end
end