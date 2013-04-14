class StripeAdmin.Views.StripeBasicInfo extends Backbone.View
  template: JST['admin/stripe_items/stripe_basic_info']
  el: "<div class='stripe-basic-info' />"

  events:
    'change input:radio[name=alignment]' : 'selectTitle'
    'blur #basic-info-stripe-container': 'saveStripe'

  render: ->
    console.log "render save stripe"
    $(@el).html(@template(stripe: @model))
    @setStripeValues()
    this

  setStripeValues: ->
    @$('input:radio[name=alignment][value=' + @model.get('alignment') + ']').prop("checked",true);

  saveStripe: (e) ->
    e.preventDefault()
    title = $.trim(@$('.stripe-name-input').val())
    orientation = @$('input:radio[name=alignment]:checked').val()
    if ((title != '') and (orientation != ''))
      @model.unset("redirect", {silent: true})
      @model.set({title: title, alignment: orientation})
      if @model.hasChanged()
        @model.save()

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response, responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

  selectTitle: (e) ->
    e.preventDefault()
    @$('.stripe-name-input').focus()


  renderShow: ->

  updateStripeItem: ->

  leave: ->
    @unbindFromAll();
    @remove()