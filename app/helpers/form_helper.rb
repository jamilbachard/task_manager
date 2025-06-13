module FormHelper
  def input_classes(object, field, base_classes = "form-input-base")
    error_classes = "form-input-error"
    normal_classes = "form-input-normal"

    "#{base_classes} #{object.errors[field].any? ? error_classes : normal_classes}"
  end

  def input_error_message(object, field)
    return unless object.errors[field].any?

    content_tag(:p, object.errors[field].join(", "), class: "form-error-message")
  end

  def form_label(form, field, text = nil)
    form.label field, text, class: "form-label"
  end

  def form_submit(form, text = nil)
    form.submit text, class: "form-submit-button"
  end
end
