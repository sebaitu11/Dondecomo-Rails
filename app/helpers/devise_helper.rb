module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages

    html = <<-HTML

    <script type="text/javascript">
        _.each(#{messages},function(mes){
          toastr.error(mes)
        })
    </script>
    HTML

    html.html_safe
  end
end
