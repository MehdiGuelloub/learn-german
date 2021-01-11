class MyFormBuilder < ActionView::Helpers::FormBuilder
  def select(method, choices, options = {}, html_options = {})
    @template.tag.div(class: 'form-group row') do
      @template.label(@object_name, method, object.class.human_attribute_name(method), options.merge({class: 'col-sm-4 col-form-label'}))
      .concat(
        @template.tag.div(class: 'col-sm-8 col-form-label') do
          super(method, choices, options, html_options.reverse_merge({class: 'custom-select'}))
        end
      )
    end
  end

  def check_box(method, options = {})
    @template.tag.div(class: 'form-group row') do
      @template.label(@object_name, method, object.class.human_attribute_name(method), options.merge({class: 'col-sm-4 col-form-label'}))
      .concat(
        @template.tag.div(class: 'col-sm-8') do
          super(method, options)
        end
      )
    end
  end

  %i[text_area text_field].each do |text_input|
    define_method text_input do |method, options = {}, html_options = {}|
      options[:class] = Array(options[:class])
      options[:class] << 'form-control'
      @template.tag.div(class: 'form-group row') do
        @template.label(@object_name, method, object.class.human_attribute_name(method), options.merge({class: 'col-sm-4 col-form-label'}))
        .concat(
          @template.tag.div(class: 'col-sm-8') do
            super(method, options)
          end
        )
      end
    end
  end
end