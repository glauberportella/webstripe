class StripeAdmin.Views.SaveStripe extends Support.CompositeView
  template: JST['admin/stripe_items/save_stripe']
  el: "<div class='save-stripe' />"

  events:
    'click .done-button': 'saveStripe'
    'click .back-to-editor': 'backToEditor'

  render: ->
    console.log "render save stripe"
    $(@el).html(@template())
    @setInfo()
    this

  setInfo: ->
    if @model.get('title') != "Untitled"
      @$('input:text[name=stripe-name]').val(@model.get('title'))
      @$('input:radio[name=alignment][value=' + @model.get('alignment') + ']').prop("checked",true);

  saveStripe: (e) ->
    e.preventDefault()
    title = $.trim(@$('.stripe-name-input').val())
    orientation = @$('input:radio[name=alignment]:checked').val()

    if ((title != '') and (orientation != ''))
      @model.save {state: "published", title: title, alignment: orientation},
        silent: true
        while: true
        success: (stripe) =>
          window.location = "/admin/stripes"
        error: ->
          @handleError

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response, responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

  backToEditor: (e) ->
    e.preventDefault()
    @parent._removeChild(this)
    @parent.render()
    @parent.createEmptySlide()
    @parent.$(".stripe-box-bottom").show

  leave: ->
    @unbindFromAll();
    @remove()