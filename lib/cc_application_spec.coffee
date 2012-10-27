describe "CC_Application", ->
  it 'should be defined', ->
    expect(CC_Application).toBeDefined()

  it 'should define the FormData model', ->
    expect(CC_Application.FormInfo).toBeDefined()

  it 'should be able to create a FormData object', ->
    expect(CC_Application.FormInfo.create()).not.toBeNull()

  it 'should define the WhoInfo model', ->
    expect(CC_Application.WhoInfo).toBeDefined()

  it 'should be able to create a WhoInfo object', ->
    expect(CC_Application.WhoInfo.create()).not.toBeNull()

  # this holds the entire form object
  describe "FormInfo", ->
    beforeEach ->
      @form_info = CC_Application.FormInfo.create()

    it 'should have a who_info property', ->
      expect(@form_info.who_info).toBeDefined()

    it 'should initialize the who_info property with a who_info object', ->
      expect(@form_info.who_info).not.toBeNull()
      expect(@form_info.who_info.first_name).toBeDefined()

  # "who" info describes information about the person: name, dob, ssn, mother's maiden name
  describe "WhoInfo", ->
    beforeEach ->
      @who_info = CC_Application.WhoInfo.create()

    it 'should have a first name property', ->
      expect(@who_info.first_name).toBeDefined()

    it 'should have a last name property', ->
      expect(@who_info.last_name).toBeDefined()

    it 'should have a ssn property', ->
      expect(@who_info.ssn).toBeDefined()

    it 'should have a birth_date property', ->
      expect(@who_info.birth_date).toBeDefined()

    it 'should have a mother_maiden_name property', ->
      expect(@who_info.mother_maiden_name).toBeDefined()

