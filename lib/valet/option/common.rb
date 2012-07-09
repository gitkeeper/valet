module Valet
  module Option
    class Common
      def self.create(name, params = {})
        option = new(name, params)
        option
      end

      attr_reader :name
      attr_accessor :short_name, :description, :default, :value

      def initialize(name, params = {})
        @name        = name
        @short_name  = params[:short]
        @description = params[:desc]
        @default     = params[:default]
        @value       = @default
      end

      def switch?
        false
      end

      def flag?
        false
      end
    end
  end
end
