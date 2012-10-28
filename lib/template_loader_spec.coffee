describe "TemplateLoader", ->

  describe 'load_template', ->
    it 'calls the error callback if the template is not present', ->
      spyOn($, "ajax").andCallFake((address, params) ->
        params.error({}, "load error")
      )
      TemplateLoader.load_template(
        'templates/not_there'
        -> this.fail()
        (status) -> expect(status).toBe("Could not load template: load error")
      )

    it 'returns a template if the template exists', ->
      spyOn($, "ajax").andCallFake((address, params) ->
        params.success("foo")
      )
      TemplateLoader.load_template(
        '/templates/template_test.handlebars'
        (data) -> expect(data).toBe("foo")
        -> this.fail()
      )

  describe 'initialize', ->
    it 'accepts a single template to load', ->
      success_called = false
      TemplateLoader.initialize(
        "/templates/template_test.handlebars"
        -> success_called = true
        -> this.fail()
      )
      waitsFor(
        -> success_called
        "success function to be called"
        500
      )
      runs ->
        expect(TemplateLoader.templates.get("/templates/template_test.handlebars")).toBeDefined()

    it 'fails if a template does not compile', ->
      error_called = false
      TemplateLoader.initialize(
        "/templates/template_fail.handlebars"
        -> this.fail()
        -> error_called = true
      )
      waitsFor(
        -> error_called
        "error function to be called"
        500
      )
      runs ->
        expect(TemplateLoader.templates.get("/templates/template_fail.handlebars")).toBeUndefined()

describe "Hash", ->
  it 'starts out empty', ->
    test = new Hash
    expect(test.count()).toBe(0)
    expect(test.get("foo")).toBeUndefined()

  it 'can add a value', ->
    test = new Hash
    test.add("foo", "bar")
    expect(test.count()).toBe(1)
    expect(test.get("foo")).toBe("bar")
    
  it 'can remove a value', ->
    test = new Hash
    test.add("foo", "bar")
    test.remove("foo")
    expect(test.count()).toBe(0)
    expect(test.get("foo")).toBeUndefined()
