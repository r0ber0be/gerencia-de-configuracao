module CitiesHelper
  def translate(object = nil, method = nil)
    object && method ? object.model.human_attribute_name(method) : 'Informe os parâmetros corretamente.'
  end
end
