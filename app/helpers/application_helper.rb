module ApplicationHelper
  def calendar_datepicker(method, builder, html_options={})
		default_date = builder.object.method(method).call() || Date.today()
    render partial: 'application/datepicker',
      locals: {
				method: method,
				default_date: default_date,
			 	builder: builder,
				html_options: html_options
			}
  end
end
