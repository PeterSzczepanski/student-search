class StudentSearchTerm

  attr_reader :where_clause, :where_args, :order

  def initialize(search_term)
     search_term = search_term.downcase
     @where_clause = ""
     @where_args = {}
     build_for_name_search(search_term)
  end

  private

  def build_for_name_search(search_term)
    t = search_term.split(' ')

    # Assumptions:
    # * Partial fuzzy match will search both first and last name
    # * Full name is entered in First Last order. Max of two seach terms are supported.
    t.size == 2 ? full_name_search(t) : partial_name_search(t.first)
  end

  # @param [Array] - contains ["<first_name>", "<last_name>"]
  def full_name_search(search_term)
    @where_clause << case_insensitive_search(:first_name)
    @where_args[:first_name] = starts_with(search_term.first)

    @where_clause << " AND #{case_insensitive_search(:last_name)}"
    @where_args[:last_name] = starts_with(search_term.last)

    @order = "last_name asc"
  end

  # @param [String] - contains single search term
  def partial_name_search(search_term)
    @where_clause << case_insensitive_search(:first_name)
    @where_args[:first_name] = starts_with(search_term)

    @where_clause << " OR #{case_insensitive_search(:last_name)}"
    @where_args[:last_name] = starts_with(search_term)

    @order = "last_name asc"
  end

  def starts_with(search_term)
    search_term + "%"
  end

  def case_insensitive_search(field_name)
    "lower(#{field_name}) like :#{field_name}"
  end
end