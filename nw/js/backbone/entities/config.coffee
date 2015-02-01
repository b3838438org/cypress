@App.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Config extends Entities.Model
    env: (str) ->
      env = @get("env")
      switch
        when _.isString(str) then env is str
        else env

    getUser: ->
      @cache.getUser()

    setUser: (user) ->
      @cache.setUser(user)

    addProject: (path) ->
      @cache.addProject(path)

    getProjectPaths: ->
      @cache.getProjectPaths()

    runProject: (path) ->
      @project = @booter(path)

      @project.boot().get("settings")

    closeProject: ->
      @project.close().bind(@).then ->
        delete @project

    logIn: (code) ->
      @cache.logIn(code).bind(@)
      .then (user) ->
        @setUser(user)
        App.execute "set:current:user", user
      .catch (err) ->
        ## ...could not log in...
        debugger
        console.log("Error logging in!")
        throw err

  App.reqres.setHandler "config:entity", (attrs = {}) ->
    props = ["cache", "booter", "request"]

    config = new Entities.Config _(attrs).omit props...

    _.each props, (prop) ->
      config[prop] = attrs[prop]

    config