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

  it 'should have a formController', ->
    expect(CC_Application.formController).toBeDefined()

  it 'should have a form view', ->
    expect(CC_Application.FormView).toBeDefined()

  describe "formController", ->
    it 'should have a form_info object', ->
      expect(CC_Application.formController.form_info).toBeDefined()
      expect(CC_Application.formController.form_info).not.toBeNull()

    # this is not a terribly good test - should be refactored
    it 'should be valid when the fields are valid', ->
      who_info = CC_Application.WhoInfo.create()
      who_info.set 'first_name', "Steve"
      who_info.set 'last_name', "Rogers"
      who_info.set 'ssn', "123-45-6789"
      who_info.set 'birth_date', "07/04/1922"
      who_info.set 'mother_maiden_name', "Rogers"
      where_info = CC_Application.WhereInfo.create()
      where_info.set 'street', "123 Magnolia Lane"
      where_info.set 'city', "Somewhereville"
      where_info.set 'state', "Denial"
      where_info.set 'zip', "12345"
      CC_Application.formController.form_info.set("who_info", who_info)
      CC_Application.formController.form_info.set("where_info", where_info)
      expect(CC_Application.formController.is_valid()).toBeTruthy()

      #reset after test
      CC_Application.formController.form_info = CC_Application.FormInfo.create()

  # this holds the entire form object
  describe "FormInfo", ->
    beforeEach ->
      @form_info = CC_Application.FormInfo.create()

    it 'should have a who_info property', ->
      expect(@form_info.who_info).toBeDefined()

    it 'should initialize the who_info property with a whoInfo object', ->
      expect(@form_info.who_info).not.toBeNull()
      expect(@form_info.who_info.first_name).toBeDefined()

    it 'should have a where_info property', ->
      expect(@form_info.where_info).toBeDefined()

    it 'should initialize the where_info property with a whereInfo object', ->
      expect(@form_info.where_info).not.toBeNull()
      expect(@form_info.where_info.street).toBeDefined()

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

    describe "valid checks", ->
      beforeEach ->
        @who_info.set 'first_name', "Steve"
        @who_info.set 'last_name', "Rogers"
        @who_info.set 'ssn', "123-45-6789"
        @who_info.set 'birth_date', "07/04/1922"
        @who_info.set 'mother_maiden_name', "Rogers"

      it 'should be valid when all the fields are filled out', ->
        expect(@who_info.get('valid')).toBeTruthy()

      it 'should not be valid when the first_name is missing', ->
        expect(@who_info.get('valid')).toBeTruthy()
        @who_info.set 'first_name', null
        expect(@who_info.get('valid')).toBeFalsy()
        @who_info.set 'first_name', ""
        expect(@who_info.get('valid')).toBeFalsy()

      it 'should not be valid when the last_name is missing', ->
        expect(@who_info.get('valid')).toBeTruthy()
        @who_info.set 'last_name', null
        expect(@who_info.get('valid')).toBeFalsy()
        @who_info.set 'last_name', ""
        expect(@who_info.get('valid')).toBeFalsy()

      it 'should not be valid when the ssn is missing', ->
        expect(@who_info.get('valid')).toBeTruthy()
        @who_info.set 'ssn', null
        expect(@who_info.get('valid')).toBeFalsy()
        @who_info.set 'ssn', ""
        expect(@who_info.get('valid')).toBeFalsy()

      it 'should not be valid when the birth_date is missing', ->
        expect(@who_info.get('valid')).toBeTruthy()
        @who_info.set 'birth_date', null
        expect(@who_info.get('valid')).toBeFalsy()
        @who_info.set 'birth_date', ""
        expect(@who_info.get('valid')).toBeFalsy()

      it 'should not be valid when the mother_maiden_name is missing', ->
        expect(@who_info.get('valid')).toBeTruthy()
        @who_info.set 'mother_maiden_name', null
        expect(@who_info.get('valid')).toBeFalsy()
        @who_info.set 'mother_maiden_name', ""
        expect(@who_info.get('valid')).toBeFalsy()

  describe "WhereInfo", ->
    beforeEach ->
      @where_info = CC_Application.WhereInfo.create()

    it 'should have a street address', ->
      expect(@where_info.street).toBeDefined()

    it 'should have a city', ->
      expect(@where_info.city).toBeDefined()

    it 'should have a state', ->
      expect(@where_info.state).toBeDefined()

    it 'should have a zip code', ->
      expect(@where_info.zip).toBeDefined()

    describe "valid checks", ->
      beforeEach ->
        @where_info.set 'street', "123 Magnolia Lane"
        @where_info.set 'city', "Somewhereville"
        @where_info.set 'state', "Denial"
        @where_info.set 'zip', "12345"

      it 'should be valid when all the fields are filled out', ->
        expect(@where_info.get('valid')).toBeTruthy()

      it 'should not be valid when the street is missing', ->
        expect(@where_info.get('valid')).toBeTruthy()
        @where_info.set 'street', null
        expect(@where_info.get('valid')).toBeFalsy()
        @where_info.set 'street', ""
        expect(@where_info.get('valid')).toBeFalsy()

      it 'should not be valid when the city is missing', ->
        expect(@where_info.get('valid')).toBeTruthy()
        @where_info.set 'city', null
        expect(@where_info.get('valid')).toBeFalsy()
        @where_info.set 'city', ""
        expect(@where_info.get('valid')).toBeFalsy()

      it 'should not be valid when the state is missing', ->
        expect(@where_info.get('valid')).toBeTruthy()
        @where_info.set 'state', null
        expect(@where_info.get('valid')).toBeFalsy()
        @where_info.set 'state', ""
        expect(@where_info.get('valid')).toBeFalsy()

      it 'should not be valid when the zip code is missing', ->
        expect(@where_info.get('valid')).toBeTruthy()
        @where_info.set 'zip', null
        expect(@where_info.get('valid')).toBeFalsy()
        @where_info.set 'zip', ""
        expect(@where_info.get('valid')).toBeFalsy()
