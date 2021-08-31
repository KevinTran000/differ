module Differ
  module Format
    module HTML_Differ
      class << self
        def format(change)
          (change.change? && as_change(change)) ||
          (change.delete? && as_delete(change)) ||
          (change.insert? && as_insert(change)) ||
          ''
        end

        # private
        def as_insert(change)
          %Q{<ins class="differ" style="background-color: green;">#{change.insert}</ins>}
        end

        def as_delete(change)
          %Q{<span class="differ" style="background-color: red;">#{change.delete}</span>}
        end

        def as_change(change)
          as_delete(change) << as_insert(change)
        end
      end
    end
  end
end