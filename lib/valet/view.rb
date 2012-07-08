module Valet
  class View < Mustache
    self.view_namespace = 'Valet::Views'
    self.template_path = 'templates'

    def render
      fall_back_to_valet unless template_exists?
      super
    end

    def escapeHTML(string)
      string
    end

    private

    def fall_back_to_valet
      self.template_path = valet_template_path
    end

    def valet_template_path
      File.expand_path('../templates', __FILE__)
    end

    def template_exists?
      File.exists?(template_file)
    end
  end
end
