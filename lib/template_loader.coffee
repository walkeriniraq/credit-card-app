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

load_template = () ->


window.TemplateLoader = {
  templates: new Hash()
  load_template: load_template
}

window.Hash = Hash