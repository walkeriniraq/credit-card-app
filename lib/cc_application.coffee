#########################################
# Application
#########################################
CC_Application = Ember.Application.create()

#########################################
# Models
#########################################
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

#########################################
# Controllers
#########################################
CC_Application.formController = Ember.ObjectController.create(
  form_info: null
  init: ->
    this.form_info = CC_Application.FormInfo.create()
)

#########################################
# Views
#########################################
TemplateLoader.initialize(
  "/templates/cc_app.handlebars"
  (template) ->
    CC_Application.FormView = Ember.View.create(
      template: template
    )
    CC_Application.FormView.append()

  (error) ->
    alert "Error loading application template: #{error}"
)

#########################################
# Init
#########################################
CC_Application.initialize()

window.CC_Application = CC_Application