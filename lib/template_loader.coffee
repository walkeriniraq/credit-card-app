# requires jQuery
class Hash
  cache: {}
  elements: 0

  count: =>
    @elements

  add: (name, template) =>
    @cache[name] = template
    @elements++

  get: (name) =>
    @cache[name]

  remove: (name) =>
    delete @cache[name]
    @elements--

load_template = (template_path, success, error) ->
  $.ajax(template_path, {
    dataType: "text"
    error: (xhr, status, e) ->
      error("Could not load template: " + status)
    success: (data) ->
      success(data)
  })

# eventually I would like this to be able to take multiple templates and call success once
# they've all been loaded. Would probably use something like: http://api.jquery.com/category/deferred-object/
initialize = (template, success, error) ->
  load_template(
    template
    (template_code) ->
      try
        compiled_template = Ember.Handlebars.compile(template_code)
      catch err
        error(err)
        return
      TemplateLoader.templates.add(template, compiled_template)
      success(compiled_template)
    (error_text) ->
      error(error_text)
  )

window.TemplateLoader = {
  templates: new Hash()
  load_template: load_template
  initialize: initialize
}

window.Hash = Hash