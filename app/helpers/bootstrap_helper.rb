module BootstrapHelper
  def link_to_btn name, path, options={}
    icon_class = ""
    icon_class = "icon-#{options.delete(:icon)}" if options[:icon].present?
    icon_class += " icon-white" if options.delete(:white).present?
    type = options.delete(:type) || ""
    options[:class] ||= ""
    options[:class] += " btn "
    options[:class] += " btn-#{type}" unless type.blank?
    options[:class] += " btn-#{options.delete(:size)}" if options[:size].present?
    link_to path, options do
      raw("#{content_tag(:i, "", class: icon_class)} #{name}")
    end
  end
end
