module ApplicationHelper
    def object_errors(object)
        if object.errors.any?
         render partial: 'pharmacies/errors', locals: {object: object}
        end
     end
end
