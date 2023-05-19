require_relative "./graph"
class Knight

    attr_accessor :current, :target

    def initialize(cur = [0, 0], tar = [0, 0])
        @current = cur
        @target = tar
    end
end