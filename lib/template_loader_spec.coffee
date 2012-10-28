describe "TemplateLoader", ->
  it 'is created without any templates loaded', ->
    expect(TemplateLoader.templates).toBeDefined()
    expect(TemplateLoader.templates).not.toBeNull()
    expect(TemplateLoader.templates.count()).toBe(0)



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
