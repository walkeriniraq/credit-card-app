CC_Application = Ember.Application.create()

CC_Application.FormInfo = Ember.Object.extend(
  who_info: null
  where_info: null
  init: ->
    this._super()
    this.who_info = CC_Application.WhoInfo.create()
    this.where_info = CC_Application.WhereInfo.create()
)

CC_Application.WhereInfo = Ember.Object.extend(
  street: null
  city: null
  state: null
  zip: null
  valid: (->
    @get('street')? && @get('city')? && @get('state')? && @get('zip')?
  ).property('street', 'city', 'state', 'zip')
)

CC_Application.WhoInfo = Ember.Object.extend(
  first_name: null
  last_name: null
  ssn: null
  birth_date: null
  mother_maiden_name: null
)

CC_Application.initialize()

window.CC_Application = CC_Application