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
  get_data_as_json: ->
    {
      first_name: this.form_info.who_info.first_name
      last_name: this.form_info.who_info.last_name
    }
)

#########################################
# Views
#########################################
CC_Application.submitButton = Ember.View.extend(
  click: (evt) ->
    alert JSON.stringify(CC_Application.formController.get_data_as_json())
)

template_error = false
TemplateLoader.initialize(
  "/templates/cc_app.handlebars"
  (template) ->
    CC_Application.FormView = Ember.View.create(
      template: template
      form: CC_Application.formController.form_info
    )
  (error) ->
    alert "Error loading application template: #{error}"
    template_error = true
)

#########################################
# Init
#########################################
CC_Application.initialize()

CC_Application.wait_for_load = (callback) ->
  if CC_Application.FormView
    return
  waitfn = setInterval(
    ->
      if CC_Application.FormView
        clearInterval(waitfn)
        callback()
        return
    100
  )

window.CC_Application = CC_Application