# frozen_string_literal: true

module Contacts
  class Filter
    DEFAULT_PER_PAGE = 20

    attr_reader :pagination_params, :filter_params

    def initialize(filter_params, pagination_params)
      @filter_params = filter_params
      @pagination_params = pagination_params
    end

    def execute
      contacts = Contact.order(sort_by)

      contacts = contacts.includes(:user).limit(per_page).offset(offset)
      contacts = contacts.where(filters) if filter_params.present?

      contacts
    end

    private

    def filters
      filters = filter_params.reduce([[]]) do |memo, value|
        memo[0] << value[0]
        memo << value[1..]
      end

      filters[0] = filters[0].join!(' AND ')

      filters.flatten!
    end

    def offset
      (page - 1) * per_page
    end

    def sort_by
      if !pagination_params['sort_by'] || pagination_params['sort_by'].keys.any? do |attr|
           Contact.attribute_names.execlude?(attr)
         end
        return { name: :desc }
      end

      pagination_params['sort_by']
    end

    def per_page
      pagination_params['per_page']&.to_i || DEFAULT_PER_PAGE
    end

    def page
      pagination_params['page']&.to_i || 1
    end
  end
end
